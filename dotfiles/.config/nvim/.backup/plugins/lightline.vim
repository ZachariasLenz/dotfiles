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
    \   'left': [['mode', 'paste'], ['gitbranch'], ['lspstatus', 'treesitter']],
    \   'right': [['wordcount', 'lineinfo', 'fileencoding']]
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
    \   'fileencoding': 'LightlineFileEncoding',
    \   'gitbranch': 'LightlineGitBranch',
    \   'lineinfo': 'LightlineLineInfo',
    \   'lspstatus': 'LightlineLSPStatus',
    \   'mode': 'LightlineMode',
    \   'treesitter': 'LightlineTreesitter',
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

function! LightlineFileEncoding() abort
    if s:IsIgnoredFiletype() || winwidth(0) <= s:win_small_size
        return ''
    endif

    return &fileencoding == 'utf-8' ? '' : &fileencoding
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

    return ' ' . line('.') . '/' . line('$') . ':' . col('.')
endfunction

function! LightlineLSPStatus() abort
    if luaeval('#vim.lsp.buf_get_clients() > 0')
        let diagnostics = luaeval("require('lsp-status').diagnostics()")
        let l:errors = get(diagnostics, 'errors', 0)
        let l:warnings = get(diagnostics, 'warnings', 0)
        let l:hints = get(diagnostics, 'hints', 0)
        let l:info = get(diagnostics, 'info', 0)
        return ' ' . l:errors . '  ' . l:warnings . '  ' . l:hints . '  ' . l:info
    else
        return ''
    endif
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

function! LightlineTreesitter() abort
    if s:IsIgnoredFiletype() || winwidth(0) <= s:win_small_size
        return ''
    endif

    let l:statusline_length = LightlineFileEncoding() . LightlineGitBranch() . LightlineLSPStatus() . LightlineLineInfo() . LightlineMode() . LightlineWordCount()
    let l:remaining_length = winwidth(0) - len(l:statusline_length) - 10
    if l:remaining_length > 30
        let l:message = nvim_treesitter#statusline(l:remaining_length)
        return l:message == v:null ? '' : l:message
    else
        return ''
    endif
endfunction

function! LightlineWordCount() abort
    if &filetype == 'markdown'
        let l:old_status = v:statusmsg
        execute "silent normal g\<c-g>"
        try
            let l:word_count = str2nr(split(v:statusmsg)[11])
        catch
            let l:word_count = 0
        endtry
        let v:statusmsg = l:old_status

        if l:word_count == 0
            return ''
        elseif l:word_count == 1
            return l:word_count . ' word'
        else
            return l:word_count . ' words'
        endif
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
    return '/^help|startify|vim-plug|qf/' =~? &ft
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
