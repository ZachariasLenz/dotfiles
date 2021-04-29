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
      local filetypes = require('zl.utils').filetypes

      -- Plugin manager.
      use 'wbthomason/packer.nvim'

      -- Neovim implementation of Magit.
      use {
         'TimUntersberger/neogit',
         config = 'vim.api.nvim_set_keymap("n", "<leader>g", ":Neogit<CR>", {})',
         requires = 'nvim-lua/plenary.nvim',
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

      -- Query local and remote thesauruses.
      use {
         'ahayman/thesaurus_query.vim',
         config = function() require('zl.plugin.thesaurus_query') end,
      }

      -- Comment code.
      use {
         'b3nj5m1n/kommentary',
         config = function() 
            require('kommentary.config').configure_language('lua', {
               prefer_single_line_comments = true,
            })
         end,
		}

      -- Treat snake_cased and camelCased words as separate words for motions.
      use {
         'chaoren/vim-wordmotion',
         cond = function()
            local utils = require('zl.utils')
            return not utils.contains(utils.filetypes.text, vim.bo.filetype)
         end,
      }

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
         config = function() 
            require('zl.plugin.completion_dictionary')
            require('zl.plugin.completion')
         end,
         requires = {'hrsh7th/vim-vsnip', 'rafamadriz/friendly-snippets'}
      }

      -- Distraction-free writing.
      use {
         'junegunn/goyo.vim',
         config = function()
            vim.g.goyo_width = 80
            vim.cmd[[autocmd! User GoyoEnter Limelight]]
            vim.cmd[[autocmd! User GoyoLeave Limelight!]]
            vim.api.nvim_set_keymap('n', 'L', ':Goyo<CR>', {silent = true})
         end,
         requires = 'junegunn/limelight.vim',
      }

      -- Generate docstrings for many languages.
      use {
         'kkoomen/vim-doge',
         config = function()
            vim.g.doge_doc_standard_python = 'google'
            vim.g.doge_comment_jump_modes = {'n', 's'}
         end,
         run = function() vim.fn[[doge#install()]] end,
      }

      -- Show signs in the gutter with the current git status.
      use {
         'lewis6991/gitsigns.nvim',
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
         end,
      }

      -- Neovim integration with zk (https://github.com/mickael-menu/zk).
      use {
         'megalithic/zk.nvim',
         config = function()
            require('zk').setup({
               enable_default_keymaps = false,
               fuzzy_finder = 'telescope',
               link_format = 'wikilink',
            })
         end,
         ft = 'markdown',
         run = ':ZkInstall',
      }

      -- Automatically format code and text.
      use {
         'mhartington/formatter.nvim',
         config = function() require('zl.plugin.formatter') end,
      }

      -- Install LSP servers and related utilities for code intelligence.
      use {
         'neovim/nvim-lspconfig',
         as = 'lspconfig',
         config = function() require('zl.plugin.lsp') end,
      }
      use {
         'alexaandru/nvim-lspupdate',
         after = 'lspconfig',
         requires = 'lspconfig',
         run = ':LspUpdate',
      }
      use {
         'kosayoda/nvim-lightbulb',
         after = 'lspconfig',
         config = function()
            require('nvim-lightbulb').update_lightbulb {
               sign = {enabled = false},
               virtual_text = {
                  enabled = true,
                  text = "💡",
               },
            }
         end,
         requires = 'lspconfig',
      }

      -- Fuzzy finder for everything.
      use {
         'nvim-telescope/telescope.nvim',
         config = function() require('zl.plugin.telescope') end,
         requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'},
      }
      use {
         'nvim-telescope/telescope-frecency.nvim',
         after = 'telescope.nvim',
         config = function()
            require('telescope').load_extension('frecency')
            vim.api.nvim_set_keymap('n', '<leader>fF', '<Cmd>lua require("telescope").extensions.frecency.frecency()<CR>', {noremap = true, silent = true})
         end,
         requires = {'telescope.nvim', 'tami5/sql.nvim'},
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
            require('hop').setup {
               keys = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
            }
            vim.api.nvim_set_keymap('n', 'H', "<cmd>lua require('hop').hint_words()<CR>", {})
         end,
      }

      -- Improved sentence textobjects.
      use {
         'preservim/vim-textobj-sentence',
         after = 'vim-textobj-user',
         config = 'vim.cmd[[call textobj#sentence#init()]]',
         requires = 'kana/vim-textobj-user',
      }

      -- Automatically load the session for the current directory and add
      -- session searching.
      use 'rmagatti/auto-session'
      use {
         'rmagatti/session-lens',
         config = function()
            require('telescope._extensions.session-lens').setup {
               shorten_path = false,
               previewer = false,
            }
            vim.api.nvim_set_keymap('n', '<C-space>', ':lua require("telescope._extensions.session-lens.main").search_session()<CR>', {silent = true})
         end,
         requires = {
            'auto-session',
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            'telescope.nvim',
         }
      }

      -- Bufferline with great navigation.
      use {
         'romgrk/barbar.nvim',
         config = function() require('zl.plugin.barbar') end,
         requires = 'kyazdani42/nvim-web-devicons',
      }

      -- Show outline of all LSP symbols.
      use {
         'simrat39/symbols-outline.nvim',
         config = function()
            require('symbols-outline').setup()
            vim.api.nvim_set_keymap('n', 'gO', ':SymbolsOutline<CR>', {silent = true})
         end,
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
         requires = 'vim-abolish',
      }

      -- Enable the loading of ftplugin files written in lua.
      use 'tjdevries/astronauta.nvim'

      -- Utility commands for interacting with Unix.
      use 'tpope/vim-eunuch'

      -- Better Markdown syntax highlighting.
      use {
         'vim-pandoc/vim-pandoc-syntax',
         config = function()
            vim.cmd[[let g:pandoc#syntax#conceal#urls = 1]]
            vim.cmd[[au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc]]
         end
      }

      -- Automatically add pairs for brackets, quotes, etc.
      use {
         'windwp/nvim-autopairs',
         config = function() require('zl.plugin.autopairs') end,
         requires = {'nvim-compe', 'nvim-treesitter'},
      }
   end
)
