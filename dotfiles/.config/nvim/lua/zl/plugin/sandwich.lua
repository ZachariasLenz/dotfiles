local map = vim.api.nvim_set_keymap

vim.cmd[[runtime macros/sandwich/keymap/surround.vim]]
vim.cmd[[let g:sandwich#recipes += [{'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']}] ]]
vim.cmd[[let g:sandwich#recipes += [{'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']}] ]]
vim.cmd[[let g:sandwich#recipes += [{'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1, 'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']}] ]]
vim.cmd[[let g:sandwich#recipes += [{'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['{']}] ]]
vim.cmd[[let g:sandwich#recipes += [{'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['[']}] ]]
vim.cmd[[let g:sandwich#recipes += [{'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1, 'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'], 'action': ['delete'], 'input': ['(']}] ]]

map('x', 'ib', '<Plug>(textobj-sandwich-auto-i)', {})
map('x', 'ab', '<Plug>(textobj-sandwich-auto-a)', {})
map('o', 'ib', '<Plug>(textobj-sandwich-auto-i)', {})
map('o', 'ab', '<Plug>(textobj-sandwich-auto-a)', {})

map('x', 'iq', '<Plug>(textobj-sandwich-query-i)', {})
map('x', 'aq', '<Plug>(textobj-sandwich-query-a)', {})
map('o', 'iq', '<Plug>(textobj-sandwich-query-i)', {})
map('o', 'aq', '<Plug>(textobj-sandwich-query-a)', {})
