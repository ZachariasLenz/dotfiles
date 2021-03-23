setlocal colorcolumn=89
setlocal foldmethod=indent
setlocal textwidth=88

if utils#check_plugin_installed('semshi')
    hi semshiGlobal             ctermfg=14 guifg=#8fbcbb
    hi semshiImported           ctermfg=14 guifg=#8fbcbb cterm=bold,italic  gui=bold,italic
    hi semshiParameter          ctermfg=15 guifg=#eceff4 cterm=bold         gui=bold
    hi semshiParameterUnused    ctermfg=3  guifg=#ebcb8b cterm=underline    gui=underline
    hi semshiBuiltin            ctermfg=4  guifg=#81a1c1
    hi semshiSelf               ctermfg=4  guifg=#81a1c1 cterm=italic       gui=italic
    hi semshiUnresolved         ctermfg=3  guifg=#ebcb8b cterm=underline    gui=underline
    hi semshiSelected           ctermfg=0  guifg=#3b4252 ctermbg=6          guibg=#88c0d0
endif
