" Commands
command! -nargs=* FootnoteCreate call footnotes#Create(<q-args>)
command! -nargs=0 FootnoteJump call footnotes#Jump()
command! -nargs=* Prose call Prose(<q-args>)

" Functions
function! s:GoToFileOrSearch() abort
    let filepath = expand('<cfile>')
    if filereadable(filepath)
        execute('normal! gf')
    else
        if !neuron#edit_zettel_under_cursor()
            call neuron#edit_zettel_select()
        endif
    endif
endfunction

function! s:Prose(wrap_mode) abort
    if utils#check_plugin_installed('pencil')
        if empty(a:wrap_mode)
            let l:wrap_mode = 'default'
        else
            let l:wrap_mode = a:wrap_mode
        endif
        call pencil#init({'wrap': l:wrap_mode})
    endif

    if utils#check_plugin_installed('litecorrect')
        call litecorrect#init()
    endif

    if utils#check_plugin_installed('textobj_sentence')
        call textobj#sentence#init()
    endif

    let b:coc_diagnostic_disable = 1

    setlocal colorcolumn=79
    setlocal textwidth=78
endfunction

function! s:ZettelkastenInit() abort
    if filereadable(g:neuron_dir . 'neuron.dhall')
        " We're in a Zettelkasten, so set the mappings.
        nmap <buffer> <silent> gf :call <SID>GoToFileOrSearch()<CR>
        nmap <buffer> <silent> gS :call neuron#tags_search()<CR>
    endif
endfunction

" Mappings
nmap <silent> <leader>fj :FootnoteJump<CR>
nmap <silent> <leader>fc :FootnoteCreate<CR>
nnoremap <silent> <leader>f :set operatorfunc=footnotes#CreateOperator<CR>g@
vnoremap <silent> <leader>f :<C-U>call footnotes#CreateOperator(visualmode())<CR>

nmap <leader>zT <Plug>NeuronAddTagNew
nmap <leader>zt <Plug>NeuronAddTagSearch
nmap <leader>zf <Plug>NeuronNewFolgezettel
vmap <leader>zf <ESC><Plug>NeuronNewFolgezettelFromVisual
nmap <leader>zz <Plug>NeuronNewZettel
nmap <leader>zp <Plug>NeuronPreviewZettel
nmap <leader>zr <Plug>NeuronRefreshCache
nmap <leader>zb <Plug>NeuronSearchBacklinks
nmap <leader>zc <Plug>NeuronSearchContentUnderCursor
inoremap <expr> [[ neuron#insert_zettel_complete(0)
inoremap <expr> ]] neuron#insert_zettel_complete(1)

" Initialisation
call <SID>Prose('')
call <SID>ZettelkastenInit()
