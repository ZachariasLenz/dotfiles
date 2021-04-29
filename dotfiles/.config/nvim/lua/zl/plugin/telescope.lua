local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

map('n', '<leader><leader>', '<cmd>lua require("telescope.builtin").builtin()<CR>', opts)

map('n', '<leader>ff', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
map('n', '<leader>fc', '<cmd>lua require("telescope.builtin").grep_string()<CR>', opts)
map('n', '<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<CR>', opts)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").file_browser()<CR>', opts)
map('n', '<leader>fq', '<cmd>lua require("telescope.builtin").quickfix()<CR>', opts)
map('n', '<leader>fl', '<cmd>lua require("telescope.builtin").loclist()<CR>', opts)
map('n', '<leader>fy', '<cmd>lua require("telescope.builtin").registers()<CR>', opts)

map('n', '/', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', opts)
map('n', '?', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', opts)

map('n', '<leader>fr', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
map('n', '<leader>fs', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', opts)
map('n', '<leader>fS', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<CR>', opts)
map('n', '<leader>fa', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>', opts)
map('v', '<leader>fa', '<cmd>lua require("telescope.builtin").lsp_range_code_actions()<CR>', opts)
map('n', '<leader>fd', '<cmd>lua require("telescope.builtin").lsp_document_diagnostics()<CR>', opts)
map('n', '<leader>fD', '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>', opts)
map('n', 'gd', '<cmd>lua require("telescope.builtin").lsp_definitions()<CR>', opts)

map('n', '<leader>ft', '<cmd>lua require("telescope.builtin").treesitter()<CR>', opts)
