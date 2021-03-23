"#############################################################
"# neuron.vim: Adds bindings to neuron Zettelkasten software #
"#############################################################
Plug 'PsiPhire/neuron.vim'

let g:neuron_no_mappings = 1
let g:neuron_search_backend = 'rg'

function! g:CustomNeuronIDGenerator(title) abort
    return strftime('%Y%m%d%H%M%S')
endfunction
