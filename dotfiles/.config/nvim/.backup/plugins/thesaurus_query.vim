"###########################################################################
"# thesaurus_query.vim: Find and replace a word using multiple thesauruses #
"###########################################################################
Plug 'ron89/thesaurus_query.vim'

nnoremap <leader>t :ThesaurusQueryReplaceCurrentWord<CR>
vnoremap <leader>t y:ThesaurusQueryReplace <C-r>"<CR>
