-- Function to download and install packer.nvim.
local function download_packer()
   if vim.fn.input('Download Packer? (y for yes) ') ~= 'y' then
      return
   end

   local directory = string.format(
      '%s/site/pack/packer/start/',
      vim.fn.stdpath('data')
   )
   vim.fn.mkdir(directory, 'p')

   local out = vim.fn.system(string.format(
      'git clone %s %s',
      'https://github.com/wbthomason/packer.nvim',
      directory .. '/packer.nvim'
   ))

   print(out)
   print('Downloading packer.nvim...')
   print("(You'll need to restart now)")
end

-- Download and install packer if it's not already installed. You'll need to
-- restart Neovim once packer.nvim is installed.
if not pcall(require, 'packer') then
   download_packer()
   return
end

-- Install and configure plugins.
return require('packer').startup(
   function(use)
      local utils = require('zl.utils')
      local filetypes = utils.filetypes

      -- Plugin manager.
      use 'wbthomason/packer.nvim'

      -- Neovim implementation of Magit.
      use {
         'TimUntersberger/neogit',
         keys = '<leader>g',
         requires = 'nvim-lua/plenary.nvim',
         setup = 'vim.api.nvim_set_keymap("n", "<leader>g", ":Neogit<CR>", {})',
      }

      -- Nord colorscheme.
      use {
         -- 'ZachariasLenz/nordbuddy',
         '~/projects/nordbuddy',
         config = function()
            vim.g.nord_spell = 'undercurl'
            require('colorbuddy').colorscheme('nordbuddy')
         end,
         requires = 'tjdevries/colorbuddy.nvim',
      }
      use {
         'ZachariasLenz/nord-vim',
         config = function()
            vim.g.nord_bold = true
            vim.g.nord_italic = true
            vim.g.nord_italic_comments = true
            -- vim.cmd[[colorscheme nord]]
         end,
      }

      -- Query local and remote thesauruses.
      use {
         'ahayman/thesaurus_query.vim',
         keys = '<leader>t',
         setup = function() require('zl.plugin.thesaurus_query') end,
      }

      -- Comment code.
      use {
         'b3nj5m1n/kommentary',
         keys = 'gc',
      }

      -- Project-specific spell files.
      use 'dbmrq/vim-dialect'

      -- Fading highlight after jump.
      use 'edluffy/specs.nvim'

      -- Better statusline.
      use {
         'glepnir/galaxyline.nvim',
         branch = 'main',
         config = function() require('zl.plugin.galaxyline') end,
         requires = 'kyazdani42/nvim-web-devicons',
      }

      -- Code completion from different sources.
      use {
         'hrsh7th/nvim-compe',
         config = function() require('zl.plugin.completion') end,
         requires = {'hrsh7th/vim-vsnip', 'rafamadriz/friendly-snippets'}
      }

      -- Distraction-free writing.
      use {
         'junegunn/goyo.vim',
         keys = '<leader>f',
         requires = {{'junegunn/limelight.vim', keys = '<leader>f'}},
         setup = function()
            vim.g.goyo_width = 80
            vim.cmd[[autocmd! User GoyoEnter Limelight]]
            vim.cmd[[autocmd! User GoyoLeave Limelight!]]
            vim.api.nvim_set_keymap('n', '<leader>f', ':Goyo<CR>', {silent = true})
         end,
      }

      -- Generate docstrings for many languages.
      use {
         'kkoomen/vim-doge',
         keys = '<leader>d',
         run = function() vim.fn[[doge#install()]] end,
         setup = function()
            vim.g.doge_doc_standard_python = 'google'
            vim.g.doge_comment_jump_modes = {'n', 's'}
         end,
      }

      -- Show signs in the gutter with the current git status.
      use {
         'lewis6991/gitsigns.nvim',
         after = 'nord-vim',
         config = function() require('zl.plugin.gitsigns') end,
         requires = {'nvim-lua/plenary.nvim', 'tpope/vim-repeat'},
      }

      -- Show indentation guides.
      use {
         'lukas-reineke/indent-blankline.nvim',
         branch = 'lua',
         config = 'vim.g.indent_blankline_char = "▏"',
      }

      -- Surround text and add textobjects for manipulating surrounds
      use {
         'machakann/vim-sandwich',
         config = function() require('zl.plugin.sandwich') end,
         event = 'VimEnter',
         setup = function()
            vim.g.sandwich_no_default_key_mappings = true
            vim.g.operator_sandwich_no_default_key_mappings = true
         end,
      }

      -- Highlight searches and substitions.
      use {
         'markonm/traces.vim',
         event = 'VimEnter',
         setup = function()
            vim.g.traces_abolish_integration = true
            vim.g.traces_preview_window = "winwidth('%') > 160 ? 'bot vnew' : 'bot 10new'"
         end
      }

      -- Automatically format code and text.
      use {
         'mhartington/formatter.nvim',
         config = function() require('zl.plugin.formatter') end,
         event = 'BufWritePre',
      }

      -- Install LSP servers and related utilities for code intelligence.
      use {
         'neovim/nvim-lspconfig',
         as = 'lspconfig',
         config = function() require('zl.plugin.lsp') end,
         ft = filetypes.programming,
      }
      use {
         'alexaandru/nvim-lspupdate',
         ft = filetypes.programming,
         requires = 'lspconfig',
         run = ':LspUpdate',
      }
      use {
         'kosayoda/nvim-lightbulb',
         config = function()
            require('nvim-lightbulb').update_lightbulb {
               sign = {enabled = false},
               virtual_text = {
                  enabled = false,
                  text = "💡",
               },
            }
         end,
         ft = filetypes.programming,
         requires = 'lspconfig',
      }

      -- Fuzzy finder for everything.
      use {
         'nvim-telescope/telescope.nvim',
         requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
      }

      -- Better syntax highlighting, code-based textobjects and navigation.
      use {
         'nvim-treesitter/nvim-treesitter',
         config = function() require('zl.plugin.treesitter') end,
         requires = {
            'nvim-treesitter/nvim-treesitter-refactor',
            'nvim-treesitter/nvim-treesitter-textobjects',
            'romgrk/nvim-treesitter-context',
         },
         run = ':TSUpdate',
      }

      -- Better navigation within a buffer.
      use {
         'phaazon/hop.nvim',
         as = 'hop',
         config = function()
            vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require('hop').hint_char1()<CR>", {})
            vim.api.nvim_set_keymap('n', 'F', "<cmd>lua require('hop').hint_words()<CR>", {})
            vim.api.nvim_set_keymap('n', 't', "<cmd>lua require('hop').hint_char2()<CR>", {})
            vim.api.nvim_set_keymap('n', 'T', "<cmd>lua require('hop').hint_lines()<CR>", {})
         end,
         keys = {'f', 'F', 't', 'T'},
      }

      -- Improved sentence textobjects.
      use {
         'preservim/vim-textobj-sentence',
         after = 'vim-textobj-user',
         config = 'vim.cmd[[call textobj#sentence#init()]]',
         ft = filetypes.text,
         requires = {{'kana/vim-textobj-user', ft = filetypes.text}},
      }

      -- Automatically load the session for the current directory.
      use {
         'rmagatti/auto-session',
         config = function()
            require('auto-session').setup {
               auto_session_enable_last_session=true,
            }
         end,
      }

      use {
         'romgrk/barbar.nvim',
         config = function() require('zl.plugin.barbar') end,
         requires = 'kyazdani42/nvim-web-devicons',
      }

      -- Improved syntax highlighting for almost all languages.
      use {
         'sheerun/vim-polyglot',
         event = 'VimEnter',
         setup = function() require('zl.plugin.polyglot') end,
      }

      -- Utilities for auto-correction, smarter text substitution, text case
      -- coercion and operator motions for text substitution.
      use 'tpope/vim-abolish'
      use {
         'jdelkins/vim-correction',
         after = 'vim-abolish',
         ft = filetypes.text,
         requires = 'vim-abolish',
      }
      use {
         'svermeulen/vim-subversive',
         config = function() require('zl.plugin.subversive') end,
         keys = {'s', 'ss', 'S', '<leader>s', '<leader>ss'},
         requires = 'vim-abolish',
      }

      -- Enable the loading of ftplugin files written in lua.
      use 'tjdevries/astronauta.nvim'

      -- Utility commands for interacting with Unix.
      use 'tpope/vim-eunuch'

      -- Automatically add pairs for brackets, quotes, etc.
      use {
         'windwp/nvim-autopairs',
         config = function() require('zl.plugin.autopairs') end,
         requires = {
            'hrsh7th/nvim-compe',
            'nvim-treesitter/nvim-treesitter',
         },
      }
   end
)
