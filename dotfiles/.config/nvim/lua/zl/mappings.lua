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

-- Make indentation in visual mode keep the selected text.
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- Custom text objects.
map('o', 'ie', ':execute "normal! ggVG"<CR>', opts)   -- in entire buffer.
map('o', 'iv', ':execute "normal! HVL"<CR>', opts)    -- in current viewable text in the buffer.
