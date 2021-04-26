local map = vim.api.nvim_set_keymap
local autopairs = require('nvim-autopairs')

autopairs.setup {
   check_ts = true,
}

vim.g.completion_confirm_key = ''
_G.completion_confirm=function()
   if vim.fn.pumvisible() ~= 0  then
      if vim.fn.complete_info()['selected'] ~= -1 then
         return vim.fn['compe#confirm'](autopairs.esc('<CR>'))
      else
         return autopairs.esc('<CR>')
      end
   else
      return autopairs.autopairs_cr()
   end
end

map('i', '<CR>', 'v:lua.completion_confirm()', {expr = true , noremap = true})
