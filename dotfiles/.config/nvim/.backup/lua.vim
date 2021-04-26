"###########################################
"# Configuration for all lua-based plugins #
"###########################################
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua << EOF
-- Load modules
local completion = require('completion')
local lsp_status = require('lsp-status')
local lspconfig = require('lspconfig')
local nvim_treesitter = require('nvim-treesitter.configs')

-- Register the lsp-status progress handler
lsp_status.register_progress()

-- Create function to setup mappings and autocommands for each language server
local on_attach = function(client, bufnr)
    -- Functions use for mappings
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    -- Mappings
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', 'grn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'gR', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end
    if client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("v", "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
        ]], false)
    end

    -- Register client for lsp-status to retrieve messages and to set up
    --  buffer autocommands to update the statusline and the current function
    lsp_status.on_attach(client)
end

-- Use a loop to conveniently both setup defined servers and map buffer local
-- mappings when the language server attaches
local servers = {"bashls", "pyright", "sqls"}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = lsp_status.capabilities,
    }
end

-- Configure autocompletion
completion.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,

    source = {
        path = true,
        buffer = true,
        spell = true,
        calc = true,
        nvim_lsp = true,
        nvim_lua = true,
        ultisnips = true,
        nvim_treesitter = true,
    }
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- expand snippet
--- jump to prev/next snippet's placeholder
--- move to prev/next item in completion menuone
_G.tab_complete = function()
    if vim.api.nvim_eval([[ UltiSnips#CanExpandSnippet() ]]) == 1 or vim.api.nvim_eval([[ UltiSnips#CanJumpForwards() ]]) == 1 then
        return t "<C-j>"
    elseif vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<TAB>"
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.api.nvim_eval([[ UltiSnips#CanJumpBackwards() ]]) == 1 then
        return t "<C-k>"
    elseif vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    else
        return t "<S-TAB>"
    end
end

vim.api.nvim_set_keymap("i", "<TAB>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<TAB>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-TAB>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-TAB>", "v:lua.s_tab_complete()", {expr = true})

-- Configure Treesitter
nvim_treesitter.setup {
    ensure_installed = { "bash", "python", "toml", },
    highlight = {
        enable = true,
        disable = { "c" },
    },
    incremental_selection = {
        enable = true,
        disable = { "c" },
        keymaps = {
            init_selection = "<CR>",
            scope_incremental = "<CR>",
            node_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
        },
    },
    indent = {
        enable = true,
        disable = { "c" },
    },
    refactor = {
        highlight_current_scope = {
            enable = false
        },
        highlight_definitions = {
            enable = true
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition_lsp_fallback = "gd",
                list_definitions = "<leader>D",
                list_definitions_toc = "gO",
                goto_next_usage = "<TAB>",
                goto_previous_usage = "<S-TAB>",
            },
        },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grt",
            },
        },
    },
    textobjects = {
        lsp_interop = {
            enable = true,
            peek_definition_code = {
                ["dc"] = "@function.outer",
                ["dC"] = "@class.outer",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
    },
}
EOF
