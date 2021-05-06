local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
local lsputil = require("lspconfig/util")

local filetypes = require("zl.utils").filetypes
local servers = filetypes.lsp

-- Configure ZK language server.
configs.zkls = {
   default_config = {
      cmd = { "zk", "lsp", "--log", "/tmp/zk-lsp.log" },
      filetypes = filetypes.markdown,
      get_language_id = function()
         return "markdown"
      end, -- force language ID to markdown so that LS will work
      root_dir = function()
         return vim.loop.cwd()
      end,
      settings = {},
   },
}

-- Add extra config options for sumneko lua and diagnosticls.
local sumneko_root_path = vim.fn.stdpath("data") .. "/lua-language-server"
local sumneko_binary = sumneko_root_path
   .. "/bin/Linux"
   .. "/lua-language-server"

local prettier_filetypes = vim.tbl_flatten({
   filetypes.markdown,
   {
      "html",
      "json",
      "sh",
      "toml",
      "xml",
      "yaml",
      "zsh",
   },
})
local prettier_format_filetypes = {}
for _, ft in ipairs(prettier_filetypes) do
   prettier_format_filetypes[ft] = { "prettier" }
end

local lsp_extra_config = {
   diagnosticls = {
      cmd = { "diagnostic-languageserver", "--stdio", "--log-level", "4" },
      filetypes = servers.diagnosticls,
      init_options = {
         linters = {},
         filetypes = {},
         formatters = {
            black = {
               command = "black",
               args = { "--quiet", "-" },
               rootPatterns = { ".git" },
            },
            isort = {
               command = "isort",
               args = { "--quiet", "-" },
               rootPatterns = { ".git" },
            },
            prettier = {
               command = "prettier",
               args = {
                  "--stdin-filepath",
                  "%filepath",
                  "--print-width",
                  vim.bo.textwidth,
                  "--tab-width",
                  vim.bo.tabstop,
                  "--trailing-comma",
                  "all",
                  "--no-bracket-spacing",
                  "--prose-wrap",
                  "always",
                  "--config-precedence",
                  "prefer-file",
               },
               rootPatterns = { ".git" },
            },
            stylua = {
               command = "stylua",
               args = { "--config-path", vim.env.HOME .. "/.stylua.toml", "-" },
               rootPatterns = { ".git" },
            },
         },
         formatFiletypes = vim.tbl_deep_extend("error", {
            lua = { "stylua" },
            python = { "black", "isort" },
         }, prettier_format_filetypes),
      },
      root_dir = function(fname)
         return lsputil.find_git_ancestor(fname) or lsputil.path.dirname(fname)
      end,
   },
   sumneko_lua = {
      cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
      settings = {
         Lua = {
            runtime = {
               version = "LuaJIT", -- Neovim uses LuaJIT
               path = vim.split(package.path, ";"),
            },
            diagnostics = {
               globals = { "vim" },
            },
            workspace = {
               library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
               },
            },
            telemetry = {
               enable = false,
            },
         },
      },
   },
}

-- Create function to setup mappings and autocommands for each language server.
local on_attach = function(client, bufnr)
   -- Functions use for mappings.
   local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
   end

   -- Mappings
   local opts = { noremap = true, silent = true }
   buf_set_keymap("n", "H", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
   buf_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
   buf_set_keymap(
      "n",
      "<leader>wa",
      "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
      opts
   )
   buf_set_keymap(
      "n",
      "<leader>wr",
      "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
      opts
   )
   buf_set_keymap(
      "n",
      "<leader>wl",
      "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
      opts
   )
   buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
   buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
   buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

   -- Set some keybinds conditional on server capabilities
   if client.resolved_capabilities.document_formatting then
      buf_set_keymap("n", "gq", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
      vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 5000)]])
   end
   if client.resolved_capabilities.document_range_formatting then
      buf_set_keymap(
         "v",
         "gq",
         "<cmd>lua vim.lsp.buf.range_formatting()<CR>",
         opts
      )
   end
end

-- Use a loop to conveniently both setup defined servers and map buffer local
-- mappings when the language server attaches.
for lsp, _ in pairs(servers) do
   local opts = vim.tbl_deep_extend(
      "keep",
      { on_attach = on_attach },
      lsp_extra_config[lsp] or {}
   )
   lspconfig[lsp].setup(opts)
end

-- Setup with kind mappings for auto-complete.
require("vim.lsp.protocol").CompletionItemKind = {
   "  Text",
   "  Function",
   "  Method",
   "  Constructor",
   "  Field",
   "  Variable",
   "  Class",
   "  Interface",
   "  Module",
   "  Property",
   "  Unit",
   "  Value",
   "  Enum",
   "  Keyword",
   "  Snippet",
   "  Color",
   "  File",
   "  Reference",
   "  Folder",
   "  EnumMember",
   "  Constant",
   "  Struct",
   "  Event",
   "  Operator",
   "  TypeParameter",
}
