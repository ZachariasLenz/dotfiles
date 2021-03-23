"#############################
"# fzf: Generic fuzzy search #
"#############################
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
if utils#check_plugin_installed('coc')
    Plug 'antoinemadec/coc-fzf'
endif

" Commands
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -nargs=* -bang Rg call <SID>RipgrepFzf(<q-args>, <bang>0, 0)
command! -nargs=* -bang RgHidden call <SID>RipgrepFzf(<q-args>, <bang>0, 1)
let s:rg_command = 'rg --hidden --column --line-number --no-heading
            \ --color=always --smart-case --multiline "^\w*map"
            \ -g $DOTFILES/dotfiles/.config/nvim/**/*.vim'
command! -bang -nargs=* Mappings
    \ call fzf#vim#grep(
    \   s:rg_command.shellescape(<q-args>),
    \   1,
    \   fzf#vim#with_preview(), <bang>0)

" Configuration
let g:fzf_colors = {
    \ 'fg': ['fg', 'Normal'],
    \ 'bg': ['bg', 'CursorLine'],
    \ 'hl': ['fg', 'Comment'],
    \ 'fg+': ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'bg+': ['bg', 'CursorLine', 'CursorColumn'],
    \ 'hl+': ['fg', 'Statement'],
    \ 'info': ['fg', 'PreProc'],
    \ 'border': ['fg', 'Ignore'],
    \ 'prompt': ['fg', 'Conditional'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'marker': ['fg', 'Keyword'],
    \ 'spinner': ['fg', 'Label'],
    \ 'header': ['fg', 'Comment']
    \ }
let g:fzf_layout = {'window': 'call FloatingFZF()'}

" Functions
function! FloatingFZF() abort
    let buf = nvim_create_buf(v:false, v:true)
    call setbufvar(buf, '&signcolumn', 'no')

    let height = &lines / 2
    let width = float2nr(&columns - (&columns * 2 / 10))
    let col = float2nr((&columns - width) / 2)

    let opts = {
        \ 'relative': 'editor',
        \ 'row': 6,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

    call nvim_open_win(buf, v:true, opts)
endfunction

function! s:GoToFileOrSearch() abort
    let filepath = expand('<cfile>')
    if filereadable(filepath)
        execute('normal! gf')
    else
        :Files
    endif
endfunction

function! s:RipgrepFzf(query, fullscreen, hidden) abort
    let l:hidden = a:hidden ? '--hidden ' : ''
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case ' . l:hidden . '-- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:' . reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" Mappings
nmap <silent> gf :call <SID>GoToFileOrSearch()<CR>
nmap <silent> / :BLines<CR>
nmap <silent> ? :Rg<CR>
nmap <silent> gs :BTags<CR>
if utils#check_plugin_installed('coc')
    nmap <silent> gS :CocFzfList symbols<CR>
    nmap <silent> <leader>y :<C-u>CocFzfList -A --normal yank<CR>
endif
