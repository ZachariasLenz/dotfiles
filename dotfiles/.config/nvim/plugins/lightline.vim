"####################################
"# lightline.vim: Better status bar #
"####################################
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'itchyny/vim-gitbranch'

" Configuration
let g:lightline = {
    \ 'colorscheme': 'nord',
    \ 'active': {
    \   'left': [['mode', 'paste'], ['gitbranch'], ['cocstatus']],
    \   'right': [['pencil', 'wordcount', 'lineinfo', 'fileencoding', 'filetype']]
    \ },
    \ 'inactive': {
    \   'left': [],
    \   'right': []
    \ },
    \ 'tabline': {
    \   'left': [['buffers']],
    \   'right': []
    \ },
    \ 'component_function': {
    \   'cocstatus': 'LightlineCocStatus',
    \   'fileencoding': 'LightlineFileEncoding',
    \   'filetype': 'LightlineFiletype',
    \   'gitbranch': 'LightlineGitBranch',
    \   'lineinfo': 'LightlineLineInfo',
    \   'mode': 'LightlineMode',
    \   'pencil': 'PencilMode',
    \   'wordcount': 'LightlineWordCount'
    \ },
    \ 'component_expand': {
    \   'buffers': 'lightline#bufferline#buffers',
    \ },
    \ 'component_type': {
    \   'buffers': 'tabsel',
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': ''}
    \ }
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#show_number = 2

" Functions
let s:win_medium_size = 100
let s:win_small_size = 60

function! LightlineCocStatus() abort
    let is_coc_installed = utils#check_plugin_installed('coc')
    if s:IsIgnoredFiletype() || winwidth(0) <= s:win_small_size || !is_coc_installed
        return ''
    endif

    let l:coc_status = coc#status()
    if winwidth(0) <= s:win_medium_size
        return s:CocDiagnosticStatus()
    else
        return l:coc_status
    endif
endfunction

function! s:CocDiagnosticStatus() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info)
        return ''
    endif

    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, ' ' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, ' ' . info['warning'])
    endif

    return join(msgs, ' ')
endfunction

function! LightlineFileEncoding() abort
    if s:IsIgnoredFiletype() || winwidth(0) <= s:win_small_size
        return ''
    endif

    return &fileencoding == 'utf-8' ? '' : &fileencoding
endfunction

function! LightlineFiletype() abort
    if s:IsIgnoredFiletype() || winwidth(0) <= s:win_small_size
        return ''
    endif

    return &filetype !=# '' ? WebDevIconsGetFileTypeSymbol() . ' ' . &filetype : 'no ft'
endfunction

function! LightlineGitBranch() abort
    let l:filename = expand('%t')
    let l:gitbranch = gitbranch#name()

    if s:IsIgnoredFiletype() || l:filename == '' || l:gitbranch == ''
        return ''
    endif

    let l:display_branch = "\uE725" . ' ' . l:gitbranch
    if len(l:display_branch) > 30 && winwidth(0) <= s:win_medium_size
        return strpart(l:display_branch, 0, 30)
    else
        return l:display_branch
    endif
endfunction

function! LightlineLineInfo() abort
    if s:IsIgnoredFiletype() || winwidth(0) <= s:win_small_size
        return ''
    endif

    return ' ' . line('.') . ':' . col('.')
endfunction

function! LightlineMode() abort
    if s:IsIgnoredFiletype()
        return ''
    elseif winwidth(0) >= s:win_medium_size
        return lightline#mode()
    else
        return lightline#mode()[0]
    endif
endfunction

function! LightlineWordCount() abort
    if &filetype == 'markdown'
        let s:old_status = v:statusmsg
        execute "silent normal g\<c-g>"
        let s:word_count = str2nr(split(v:statusmsg)[11])
        let v:statusmsg = s:old_status
        return s:word_count . ' words'
    else
        return ''
    endif
endfunction

function! s:DeleteNthBuffer(n) abort
    let l:buffer = lightline#bufferline#get_buffer_for_ordinal_number(a:n)
    if l:buffer >= 0
        call utils#delete_buffer('bwipeout', '!', l:buffer)
    endif
endfunction

function! s:IsIgnoredFiletype() abort
    return '/^help|startify|vim-plug|qf/' ==? &ft
endfunction

" Mappings
nmap <silent> <leader>b1 <Plug>lightline#bufferline#go(1)
nmap <silent> <leader>b2 <Plug>lightline#bufferline#go(2)
nmap <silent> <leader>b3 <Plug>lightline#bufferline#go(3)
nmap <silent> <leader>b4 <Plug>lightline#bufferline#go(4)
nmap <silent> <leader>b5 <Plug>lightline#bufferline#go(5)
nmap <silent> <leader>b6 <Plug>lightline#bufferline#go(6)
nmap <silent> <leader>b7 <Plug>lightline#bufferline#go(7)
nmap <silent> <leader>b8 <Plug>lightline#bufferline#go(8)
nmap <silent> <leader>b9 <Plug>lightline#bufferline#go(9)
nmap <silent> <leader>b0 <Plug>lightline#bufferline#go(10)

nmap <silent> <leader>bd :call utils#delete_buffer('bwipeout', '!', '')<CR>
nmap <silent> <leader>bdd :call utils#delete_buffer('bwipeout', '!', '')<CR>
nmap <silent> <leader>bd1 :call <SID>DeleteNthBuffer(1)<CR>
nmap <silent> <leader>bd2 :call <SID>DeleteNthBuffer(2)<CR>
nmap <silent> <leader>bd3 :call <SID>DeleteNthBuffer(3)<CR>
nmap <silent> <leader>bd4 :call <SID>DeleteNthBuffer(4)<CR>
nmap <silent> <leader>bd5 :call <SID>DeleteNthBuffer(5)<CR>
nmap <silent> <leader>bd6 :call <SID>DeleteNthBuffer(6)<CR>
nmap <silent> <leader>bd7 :call <SID>DeleteNthBuffer(7)<CR>
nmap <silent> <leader>bd8 :call <SID>DeleteNthBuffer(8)<CR>
nmap <silent> <leader>bd9 :call <SID>DeleteNthBuffer(9)<CR>
nmap <silent> <leader>bd0 :call <SID>DeleteNthBuffer(10)<CR>
