"##################################################
"# vim-doge: Automatically generate documentation #
"##################################################
Plug 'kkoomen/vim-doge', {'do': {-> doge#install()}}

let g:doge_doc_standard_python = 'google'
let g:doge_mapping = '<NUL>'
let g:doge_mapping_comment_jump_forward = '<C-j>'
let g:doge_mapping_comment_jump_backward = '<C-k>'

nnoremap doc :DogeGenerate<CR>
