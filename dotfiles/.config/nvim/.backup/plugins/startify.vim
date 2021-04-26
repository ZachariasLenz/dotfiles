"####################################################################
"# vim-startify: Start screen and enables better session management #
"####################################################################
Plug 'ZachariasLenz/vim-startify'

let g:startify_bookmarks = [
    \ {'c': '~/.config/nvim/coc-settings.json'},
    \ {'v': $DOTFILES . '/dotfiles/.config/nvim/init.vim'},
    \ {'z': $DOTFILES . '/dotfiles/.zshrc'}
    \ ]
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_custom_indices = ['f', 'g', 'h', 'j', 'k', 'l']
let g:startify_files_number = 5
let g:startify_fortune_use_unicode = 1
let g:startify_lists = [
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ ]
let g:startify_session_autoload = 1
let g:startify_session_persistence = 1
