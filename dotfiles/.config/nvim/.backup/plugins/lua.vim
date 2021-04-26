"#########################
"# All lua-based plugins #
"#########################
" lexima.vim: Auto-close pairs
Plug 'cohama/lexima.vim'

" lsp-status: LSP messages for statusline
Plug 'nvim-lua/lsp-status.nvim'

" nvim-compe: Autocompletion using Neovim's built-in LSP and other sources
Plug 'hrsh7th/nvim-compe'

" nvim-lspconfig: Configuration for Language Servers
Plug 'neovim/nvim-lspconfig'
Plug 'ZachariasLenz/nvim-lspupdate'

" nvim-treesitter: Generic code parser
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" nvim-treesitter-refactor: Useful refactoring tools using Treesitter
Plug 'nvim-treesitter/nvim-treesitter-refactor'

" nvim-treesitter-textobjects: Extra textobjects from Treesitter
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
