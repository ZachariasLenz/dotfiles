" Auto-save when buffer loses focus
autocmd BufLeave,FocusLost * silent! wall

" Auto-quit Vim when all actual files are closed
augroup AutoQuit
    autocmd!
    if exists('##QuitPre')
        autocmd QuitPre * call <SID>CheckRemainingBuffers(1)
    else
        autocmd BufEnter * call <SID>CheckRemainingBuffers(0)
    endif
augroup END

" Exit Paste mode when leaving Insert mode
autocmd InsertLeave * if &paste | set nopaste | endif

" Handle custom file types
autocmd BufNewFile,BufRead *.hql set filetype=sql

" Highlight yanked area
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup="IncSearch", timeout=350}
augroup END

" Functions used
function! s:CheckRemainingBuffers(quitpre) abort
    let ignored_filetypes = ['help', 'qf']
    if tabpagenr('$') == 1
        let i = 1
        while i <= winnr('$')
            if a:quitpre && i == winnr()
                let i += 1
                continue
            endif
            if index(ignored_filetypes, getbufvar(winbufnr(i), '&filetype')) >= 0 ||
                \ getwinvar(i, '&previewwindow')
                let i += 1
            else
                break
            endif
        endwhile
        if i == winnr('$') + 1
            call feedkeys(":only\<CR>:q\<CR>", 'n')
        endif
    endif
endfunction
