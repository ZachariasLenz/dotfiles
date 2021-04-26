local map = vim.api.nvim_set_keymap

vim.g.tq_map_keys = false
vim.g.tq_merriam_webster_api_key = '6f1c5271-d835-4a09-8a15-b83cba5b1fbb'
vim.g.tq_openoffice_en_file = '~/.config/nvim/thesaurus/th_en_US_new'
vim.g.tq_use_vim_autocomplete = false
vim.g.tq_enabled_backends= {
   'merriam_webster',
   'openoffice_en',
   'datamuse_com',
}

map('n', '<leader>ts', ':ThesaurusQueryReplaceCurrentWord<CR>', {})
map('v', '<leader>ts', 'y:ThesaurusQueryReplace <C-r>"<CR>', {})
map('n', '<leader>ta', ':ThesaurusQueryReplaceCurrentWordAntonym<CR>', {})
