vnoremap L >gv

" Navigate around windows using Ctrl+<direction>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Go back to previous jump
nnoremap gb <C-o>

" Improve vim's search pattern matching (and allow default / behaviour with <leader>)
nnoremap <leader>/ /\v
vnoremap / /\v
nnoremap <leader>? ?\v
vnoremap ? ?\v

" Search and replace word under cursor
nmap <leader>R :%s/\<\(<C-r><C-w>\)\>/

" Make indentation in visual mode keep the selected text
vnoremap < <gv
vnoremap > >gv

" Close all buffers but the current one and to the next, previous, last and first buffer
command! BufOnly silent! execute '%bd|e#|bd#'
nnoremap <silent> <leader>bo :BufOnly<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [B :bfirst<CR>

" Open, go the next, previous, last and first quickfix
nnoremap <silent> <leader>q :copen<CR>
nnoremap <silent> ]q :cnext<CR>
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]Q :clast<CR>
nnoremap <silent> [Q :cfirst<CR>

" Open, go the next, previous, last and first location list
nnoremap <silent> <leader>l :lopen<CR>
nnoremap <silent> ]l :lnext<CR>
nnoremap <silent> [l :lprevious<CR>
nnoremap <silent> ]L :llast<CR>
nnoremap <silent> [L :lfirst<CR>

" Easier way to exit terminal mode
tnoremap <C-c> <C-\><C-n>
