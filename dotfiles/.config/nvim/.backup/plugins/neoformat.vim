"########################################
"# neoformat: Code formatter for neovim #
"########################################
Plug 'sbdchd/neoformat'

let g:neoformat_basic_format_align = 1
let g:neoformat_basic_format_retab = 1
let g:neoformat_basic_format_trim = 1
let g:neoformat_enabled_python = ['black', 'docformatter']
let g:neoformat_run_all_formatters = 1

augroup fmt
    autocmd!
    autocmd BufWritePre * undojoin | Neoformat
augroup END
