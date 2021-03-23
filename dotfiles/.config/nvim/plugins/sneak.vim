"######################################################################
"# vim-sneak: Two-character search and improves built-in f/t commands #
"######################################################################
Plug 'justinmk/vim-sneak'

let g:sneak#label = 1 " label mode
let g:sneak#s_next = 1 " clever-s mode
let g:sneak#use_ic_scs = 1 " smart-case

hi link Sneak Search
hi link SneakScope MatchParen

nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T
