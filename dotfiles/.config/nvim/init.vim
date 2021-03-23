" Automatically install vim-plug if it is not installed
let autoload_plug_path = stdpath('config') . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
    silent execute '!curl -fL --create-dirs -o ' . autoload_plug_path .
        \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    execute 'source ' . fnameescape(autoload_plug_path)
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
unlet autoload_plug_path

" Set vim-plug timeout length
let g:plug_timeout = 120

" Specify the directory for plugins
call plug#begin(stdpath('data') . '/plugged')

" Load plugins
for f in split(glob('~/.config/nvim/plugins/*.vim'), '\n')
    execute 'source' f
endfor

" Initialize plugin system
call plug#end()

" Remap vim-sandwich key-mappings to surround.vim style mappings
runtime macros/sandwich/keymap/surround.vim

" Load settings, key-mappings and auto-commands
source ~/.config/nvim/autocommands.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/settings.vim
