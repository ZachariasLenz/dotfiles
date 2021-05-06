-- Auto-save when buffer loses focus.
vim.cmd([[autocmd BufLeave,FocusLost * silent! wall]])

-- Exit paste mode when leaving Insert mode.
vim.cmd([[autocmd InsertLeave * if &paste | set nopaste | endif]])

-- Handle custom file types.
vim.cmd([[autocmd BufNewFile,BufRead *.hql set filetype=sql]])

-- Highlight on yank (disabled in visual mode).
vim.cmd([[autocmd TextYankPost * lua vim.highlight.on_yank {on_visual = true, timeout = 350}]])
