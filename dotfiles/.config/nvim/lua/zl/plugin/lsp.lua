local lspconfig = require('lspconfig')
local configs = require('lspconfig/configs')

local filetypes = require('zl.utils').filetypes
local servers = filetypes.lsp

-- Configure ZK language server
if not lspconfig.zkls then
   configs.zkls = {
      default_config = {
         cmd = {'zk', 'lsp', '--log', '/tmp/zk-lsp.log'},
         filetypes = filetypes.markdown,
         root_dir = function() return vim.fn.getcwd() end,
         settings = {},
      };
   }
end

-- Create function to setup mappings and autocommands for each language server.
local on_attach = function(client, bufnr)
   -- Functions use for mappings.
   local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
   local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

   -- Mappings
   local opts = { noremap=true, silent=true }
   buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
   buf_set_keymap('n', 'gk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
   buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
   buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
   buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
   buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
   buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
   buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
end

-- Use a loop to conveniently both setup defined servers and map buffer local
-- mappings when the language server attaches.
for ft, lsp in pairs(servers) do
   lspconfig[lsp].setup {on_attach = on_attach}
end
