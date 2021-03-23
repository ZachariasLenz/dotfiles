"#####################################################
"# vim-sandwich: Surrounds words with specified text #
"#####################################################
Plug 'machakann/vim-sandwich'

let g:textobj_sandwich_no_default_key_mappings = 1

xmap ib <Plug>(textobj-sandwich-auto-i)
xmap ab <Plug>(textobj-sandwich-auto-a)
omap ib <Plug>(textobj-sandwich-auto-i)
omap ab <Plug>(textobj-sandwich-auto-a)
