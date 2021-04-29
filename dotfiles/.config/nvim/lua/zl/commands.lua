function _G.start_profiling()
   vim.cmd[[profile start nvim.profile]]
   vim.cmd[[profile func *]]
   vim.cmd[[profile file *]]
end

function _G.stop_profiling()
   vim.cmd[[profdel func *]]
   vim.cmd[[profdel file *]]
   vim.cmd[[qa!]]
end

vim.cmd[[command! -nargs=0 StartProfiling call v:lua.start_profiling()]]
vim.cmd[[command! -nargs=0 StopProfiling call v:lua.stop_profiling()]]

vim.cmd[[command! -nargs=0 ShowHighlight echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')]]
