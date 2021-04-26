local filetypes = require('zl.utils').filetypes

local disabled_filetypes = {'sensible'}
for _, ft in ipairs(filetypes.all) do
   table.insert(disabled_filetypes, ft .. '.plugin')
end

vim.g.polyglot_disabled = disabled_filetypes
vim.g.vim_markdown_frontmatter = true
vim.g.vim_markdown_math = true
vim.g.vim_markdown_strikethrough = true
