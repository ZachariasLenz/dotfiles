"####################################################
"# vim-pencil: Rethinking Vim as a tool for writers #
"####################################################
Plug 'reedes/vim-pencil'

let g:pencil#conceallevel = 2
let g:pencil#concealcursor = 'c'
let g:pencil#textwidth = 78
let g:pencil#wrapModeDefault = 'soft'

nmap <leader>p :call TogglePencil()<CR>

function! TogglePencil() abort
    call pencil#init({'wrap': 'toggle'})

    setlocal colorcolumn=79
    setlocal textwidth=78
endfunction
