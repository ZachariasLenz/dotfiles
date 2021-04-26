"################################################
"# vim-ditto: Find and highlight repeated words #
"################################################
Plug 'dbmrq/vim-ditto'

nmap <leader>dd :DittoOn<CR>
nmap <leader>do :DittoOff<CR>
nmap <leader>dn <Plug>DittoNext
nmap <leader>dp <Plug>DittoPrev
nmap <leader>dg <Plug>DittoGood
nmap <leader>db <Plug>DittoBad
nmap <leader>dm <Plug>DittoMore
nmap <leader>dl <Plug>DittoLess

try
    autocmd! User GoyoEnter DittoOn
    autocmd! User GoyoLeave DittoOff
catch
    " Do nothing
endtry
