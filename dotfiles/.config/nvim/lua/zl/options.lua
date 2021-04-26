local opt = require('zl.utils').opt

-- Set options
local indent = 4                                   -- use 4 spaces to indent
local text_width = 80                              -- Use a text width of 80
opt('o', 'belloff', 'all')                         -- Begone, bell!
opt('w', 'breakindent', true)                      -- keep wrapped text indented
opt('o', 'clipboard', 'unnamedplus')               -- use system clipboard
opt('w', 'colorcolumn', tostring(text_width + 1))  -- colour characters just after text width to easily see too long lines
opt('o', 'completeopt', 'menuone,noselect')        -- needed for integration with auto-completion
opt('w', 'concealcursor', 'c')                     -- only hide characters in command mode
opt('w', 'conceallevel', 2)                        -- only hide characters in command mode
opt('b', 'copyindent', true)                       -- copy the previous indentation when auto-indenting
opt('w', 'cursorline', true)                       -- highlights the current line
opt('b', 'dictionary', '/usr/share/dict/words')    -- dictionary location
opt('b', 'expandtab', true)                        -- use spaces instead of tabs
opt('o', 'foldlevelstart', 20)                     -- start with almost (all) folds open
opt('b', 'formatoptions', 'cqrnj1p')               -- c: make comments respect text width
                                                   -- q: allow formatting comments w/ gq
                                                   -- r: continue comment when pressing enter
                                                   -- n: indent past the formatlistpat, not underneath it
                                                   -- j: auto-remove comments if possible
                                                   -- 1 & p: don't break lines in weird places
opt('o', 'hidden', true)                           -- hides buffers instead of closing them
opt('o', 'hlsearch', false)                        -- disable search highlighting
opt('o', 'ignorecase', true)                       -- ignore case if search pattern is all lower,
opt('o', 'joinspaces', false)                      -- no 2 spaces after joining
opt('w', 'linebreak', true)                        -- use line breaks
opt('w', 'list', true)                             -- show tabs, trailing whitespace and EOL characters
opt('w', 'listchars', 'tab:▸ ,trail:.,nbsp:.')    -- the characters to use for displaying the above
opt('w', 'number', true)                           -- show line numbers
opt('o', 'pumblend', 17)                           -- enable better popup menu
opt('w', 'relativenumber', true)                   -- turn on hybrid line numbers
opt('w', 'scrolloff', 10)                          -- show at least 10 lines above and below cursor
opt('o', 'shiftround', true)                       -- use multiples of shift width when indenting with '<' and '>'
opt('b', 'shiftwidth', indent)                     -- set '<' and '>' to shift by `indent` spaces
opt('o', 'shortmess', vim.o.shortmess .. 'c')      -- shorten messages for integration with auto-completion
opt('o', 'showmatch', true)                        -- set show matching parenthesis
opt('o', 'showmode', false)                        -- do not show the current mode, since our statusline plugin already does
opt('o', 'showtabline', 2)                         -- always show the tab/buffer bar
opt('o', 'sidescrolloff', 5)                       -- show 5 columns after cursor
opt('w', 'signcolumn', 'yes')                      -- always show sign column
opt('o', 'smartcase', true)                        -- case-sensitive search when using mixed-case
opt('b', 'softtabstop', indent)                    -- set tab character to `indent` spaces
opt('o', 'splitbelow', true)                       -- make splits open below by default
opt('o', 'splitright', true)                       -- make splits open to the right by default
opt('b', 'tabstop', indent)                        -- set tab character to `indent` spaces
opt('o', 'termguicolors', true)                    -- use RGB colours
opt('b', 'textwidth', text_width)                  -- set max line width
opt('o', 'timeout', true)                          -- allow commands to time-out
opt('o', 'timeoutlen', 500)                        -- set time-out length to 0.5 seconds
opt('o', 'ttimeout', true)                         -- enable leader key time-out
opt('o', 'ttimeoutlen', 100)                       -- set leader key time-out to 100 ms
opt('b', 'undofile', true)                         -- create a file with undo information
opt('o', 'updatetime', 250)                        -- update more often
opt('o', 'wildignore', '__pycache__,*pycache,*/tmp/*,*.so,*.swp,*.zip,*~,*.pyc,*.aux')
opt('o', 'wildmode', 'longest:full,longest,full')
opt('o', 'wildoptions', 'pum')                     -- use popup menu for command line
