"######################################################################################
"# coc.nvim: Code completion, linting and fixing through the Language Server Protocol #
"######################################################################################
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Autocommands
autocmd FileType markdown,json,python,yaml setl formatexpr=CocAction('formatSelected')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Commands
command! -nargs=0 CocClean :!$DOTFILES/dotfiles/.config/nvim/coc_clean.sh
command! -nargs=0 SortImports :call CocAction('runCommand', 'pyright.organizeimports')

" Configuration
let g:coc_global_extensions = [
    \ 'coc-dictionary',
    \ 'coc-json',
    \ 'coc-pairs',
    \ 'coc-prettier',
    \ 'coc-pyright',
    \ 'coc-ultisnips',
    \ 'coc-vimlsp',
    \ 'coc-yaml',
    \ 'coc-yank'
    \ ]
let g:coc_status_warning_sign = ' '
let g:coc_status_error_sign = ' '

" Functions
function! s:CallUltisnipsJump(forward) abort
    if !utils#check_plugin_installed('ultisnips')
        return 0
    endif

    if a:forward
        call UltiSnips#JumpForwards()
        return g:ulti_jump_forwards_res > 0
    else
        call UltiSnips#JumpBackwards()
        return g:ulti_jump_backwards_res > 0
    endif
endfunction

function! s:CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:ShowDocumentation() abort
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h ' . expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

function! s:TabCompleteBackwards() abort
    if pumvisible()
        return "\<C-p>"
    else
        if s:CallUltisnipsJump(0)
            return ''
        else
            return "\<S-TAB>"
        endif
    endif
endfunction

function! s:TabCompleteForward() abort
    if pumvisible()
        return "\<C-n>"
    else
        if s:CallUltisnipsJump(1)
            return ''
        elseif s:CheckBackspace()
            return "\<TAB>"
        else
            call coc#refresh()
            return ''
        endif
    endif
endfunction

" Mappings
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent> <TAB> <C-R>=<SID>TabCompleteForward()<CR>
snoremap <silent> <TAB> <Esc>:call UltiSnips#JumpForwards()<CR>
inoremap <silent> <S-TAB> <C-R>=<SID>TabCompleteBackwards()<CR>
snoremap <silent> <S-TAB> <Esc>:call UltiSnips#JumpBackwards()<CR>

nmap <silent> K :call <SID>ShowDocumentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gR <Plug>(coc-rename)

nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)
nmap <silent> [E <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]E <Plug>(coc-diagnostic-next-error)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)
