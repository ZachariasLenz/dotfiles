function _G.start_profiling()
   vim.cmd([[profile start nvim.profile]])
   vim.cmd([[profile func *]])
   vim.cmd([[profile file *]])
end

function _G.stop_profiling()
   vim.cmd([[profdel func *]])
   vim.cmd([[profdel file *]])
   vim.cmd([[qa!]])
end

function _G.fix_whitespace()
   local save = vim.fn.winsaveview()
   vim.cmd([[keeppatterns %s/\s\+$//e]])
   vim.fn.winrestview(save)
end

vim.cmd([[command! -nargs=0 StartProfiling call v:lua.start_profiling()]])
vim.cmd([[command! -nargs=0 StopProfiling call v:lua.stop_profiling()]])

vim.cmd([[command! -nargs=0 ShowHighlight echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')]])

vim.cmd([[command! -bar -nargs=0 FixIndent norm gg=G<C-O>]])
vim.cmd([[command! -bar -nargs=0 FixWhitespace call v:lua.fix_whitespace()]])
