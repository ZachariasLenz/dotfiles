"######################################################
"# goyo.vim + limelight.vim: Distraction-free writing #
"######################################################
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

let g:goyo_width = 80
nmap <leader>g :Goyo<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
