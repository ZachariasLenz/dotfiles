" Disable modelines (for security)
set modelines=0

" Set colour scheme
color nord
set background=dark
set termguicolors

" Set tab and indentation properties
set copyindent                      " copy the previous indentation on auto-indenting
set expandtab                       " use spaces instead of tabs
set shiftwidth=4                    " set '<' and '>' to shift by 4 spaces
set shiftround                      " use multiples of shiftwidth when indenting with '<' and '>'
set softtabstop=4                   " set indent to 4 spaces
set tabstop=4                       " set tab character to 4 spaces

" Configure display properties of modes and commands
set noshowmode                      " do not show the current mode, since lightline already does
set showtabline=2                   " turn on the tab/buffer bar
set wildmode=longest:full,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.un~,*.pyc,*.aux

" Set line number and cursor properties
set number relativenumber           " turn on hybrid line numbers
set cursorline                      " highlights the current line

set foldlevelstart=20

" Configure line wrapping and text formatting
set colorcolumn=79                  " colour characters at position 79 to easily see too long lines
set concealcursor=c                 " only hide characters in command mode
set conceallevel=2                  " only hide characters in command mode
set formatoptions+=cn1p             " wrap lines and comment character and spaces when joining lines
set linebreak                       " set line breaks
set list                            " makes Vim show tabs, trailing whitespace and EOL characters
set listchars=tab:▸\ ,trail:.,nbsp:.
set textwidth=78                    " set max line width to 78 characters
set wrap                            " allow line wrapping

" Make splits open below and to the right by default
set splitbelow
set splitright

" Improve Vim's search
set gdefault                        " make substitutions global by default
set ignorecase                      " ignore case if search pattern is all lower,
set nohlsearch                      " disable search highlighting
set smartcase                       " case-sensitive search when using mixed-cases
set wrapscan                        " makes searches wrap around at the end of the file

" Neovim Providers
let g:python3_host_prog=$HOME . '/.pyenv/versions/neovim/bin/python'

" Create persistent undo files inside an undo directory
set undofile                        " create a file with undo information
set undolevels=1000                 " how many undos to save
set undoreload=10000                " number of lines to save for undo

" Define misc properties
set clipboard=unnamedplus           " use system clipboard
set completeopt=menuone,noselect    " Set completeopt to have a better completion experience
set dictionary+=/usr/share/dict/words
set hidden                          " hides buffers instead of closing them
set noerrorbells                    " don't beep
set scrolloff=3                     " show at least 3 lines above and below cursor
set shortmess+=c                    " Avoid showing message extra message when using completion
set showmatch                       " set show matching parenthesis
set sidescrolloff=5                 " show 5 columns after cursor
set signcolumn=yes                  " always show sign column
set timeout                         " allow commands to time-out
set timeoutlen=500                  " set time-out length to 0.5 seconds
set ttimeout                        " enable leader key time-out
set ttimeoutlen=100                 " set leader key time-out to 100 ms
set pastetoggle=<F2>                " Use F2 to enable paste mode
set updatetime=250
set visualbell                      " don't beep
