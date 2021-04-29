require('gitsigns').setup {
   keymaps = {
      noremap = true,
      buffer = true,

      ['n ]h'] = { expr = true, "&diff ? ']h' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
      ['n [h'] = { expr = true, "&diff ? '[h' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

      ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
      ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
      ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      ['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
      ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      ['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

      ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
   },
}
