local map = vim.api.nvim_set_keymap

map('n', 's', '<Plug>(SubversiveSubstitute)', {})
map('n', 'ss', '<Plug>(SubversiveSubstituteLine)', {})
map('n', 'S', '<Plug>(SubversiveSubstituteToEndOfLine)', {})
map('n', '<leader>s', '<Plug>(SubversiveSubvertRange)', {})
map('x', '<leader>s', '<Plug>(SubversiveSubvertRange)', {})
map('n', '<leader>ss', '<Plug>(SubversiveSubvertWordRange)', {})
