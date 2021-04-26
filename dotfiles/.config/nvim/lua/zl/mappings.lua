local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Easier exiting of insert mode
map('i', 'jj', '<ESC>', opts)
map('i', 'jk', '<ESC>', opts)

-- Make movement motions move on the screen level and not the file level.
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
map('n', '^', 'g^', opts)
map('n', '$', 'g$', opts)

-- Move visual block.
map('v', 'J', ":m '>+1<CR>gv=gv", opts)
map('v', 'K', ":m '<-2<CR>gv=gv", opts)
map('v', 'H', '<gv', opts)
map('v', 'L', '>gv', opts)

-- Navigate around windows using Ctrl+<direction>.
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Go back to previous jump.
map('n', 'gb', '<C-o>', opts)

-- Improve vim's search pattern matching (and allow default / behaviour with <leader>).
map('n', '<leader>/', '/\\v', opts)
map('v', '/', '/\\v', opts)
map('n', '<leader>?', '?\\v', opts)
map('v', '?', '?\\v', opts)

-- Make indentation in visual mode keep the selected text.
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Open, go the next, previous, last and first quickfix.
map('n', '<leader>q', ':copen<CR>', opts)
map('n', ']q', ':cnext<CR>', opts)
map('n', '[q', ':cprevious<CR>', opts)
map('n', ']Q', ':clast<CR>', opts)
map('n', '[Q', ':cfirst<CR>', opts)

-- Open, go the next, previous, last and first location list.
map('n', '<leader>l', ':lopen<CR>', opts)
map('n', ']l', ':lnext<CR>', opts)
map('n', '[l', ':lprevious<CR>', opts)
map('n', ']L', ':llast<CR>', opts)
map('n', '[L', ':lfirst<CR>', opts)

-- Custom text objects.
map('o', 'ie', ':execute "normal! ggVG"<CR>', opts)   -- in entire buffer.
map('o', 'iv', ':execute "normal! HVL"<CR>', opts)    -- in current viewable text in the buffer.
