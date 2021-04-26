local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('n', ']b', ':BufferNext<CR>', opts)
map('n', '[b', ':BufferPrevious<CR>', opts)
map('n', ']B', ':BufferLast<CR>', opts)
map('n', '<leader>bD', ':BufferOrderByDirectory<CR>', opts)
map('n', '<leader>bL', ':BufferOrderByLanguage<CR>', opts)
map('n', '<leader>bb', ':BufferPick<CR>', opts)
map('n', '<leader>bc', ':BufferClose<CR>', opts)
map('n', '<leader>bd', ':BufferWipeout<CR>', opts)
map('n', '<leader>bo', ':BufferCloseAllButCurrent<CR>', opts)
map('n', '<leader>bl', ':BufferCloseBuffersLeft<CR>', opts)
map('n', '<leader>br', ':BufferCloseBuffersRight<CR>', opts)
