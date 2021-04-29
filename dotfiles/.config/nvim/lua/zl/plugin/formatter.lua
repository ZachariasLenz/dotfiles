local t = require('zl.utils').t

function _G.fix_format()
   local save = vim.fn.winsaveview()
   vim.cmd[[keeppatterns %s/\s\+$//e]]
   vim.fn.winrestview(save)

   vim.api.nvim_feedkeys(t 'gg=G<C-o>', 'n', true)

   vim.cmd[[FormatWrite]]
end

vim.cmd[[command -bar -nargs=0 FixFormat call v:lua.fix_format()]]

local function black_config()
   return {exe = 'black', stdin = false}
end

local function isort_config()
   return {exe = 'isort', stdin = false}
end

local function lua_config()
   return {
      exe = 'lua-format',
      args = {
         '--column-limit', vim.bo.textwidth,
         '--indent-width', vim.bo.shiftwidth,
         '--tab-width', vim.bo.tabstop,
      },
      stdin = false,
   }
end

local function prettier_config()
   return {
      exe = 'prettier',
      args = {
         '--stdin-filepath', vim.api.nvim_buf_get_name(0),
         '--tab-width', vim.bo.tabstop,
         '--prose-wrap always'
      },
      stdin = true,
   }
end

require('formatter').setup {
   logging = true,
   filetype = {
      lua = {lua_config},
      markdown = {prettier_config},
      ['markdown.pandoc'] = {prettier_config},
      python = {black_config, isort_config},
   },
}

vim.api.nvim_exec([[
   augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost *.lua,*.md,*.py FormatWrite
   augroup END
]], true)
