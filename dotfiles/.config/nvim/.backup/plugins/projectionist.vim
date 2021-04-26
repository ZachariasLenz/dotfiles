"#########################################################
"# vim-projectionist: Jump between source and test files #
"#########################################################
Plug 'tpope/vim-projectionist'

let g:projectionist_heuristics = {
    \ 'setup.py|requirements.txt|pyproject.toml': {
    \   '*': { 'python_package': 1 }
    \ }}

function! s:detect() abort
    for [root, value] in projectionist#query('python_package')
        let package_name = substitute(fnamemodify(root, ':t'), '-', '_', '')

        if isdirectory(expand(root . '/' . package_name))
            let src_dir = package_name
        elseif isdirectory(expand(root . '/src/' . package_name))
            let src_dir = 'src/' . package_name
        elseif isdirectory(expand(root . '/src/app/' . package_name))
            let src_dir = 'src/app/' . package_name
        elseif isdirectory(expand(root . '/src/'))
            let src_dir = 'src/'
        endif

        if isdirectory(expand(root . '/tests'))
            let test_dir = 'tests'
        elseif isdirectory(expand(root . '/src/tests'))
            let test_dir = 'src/tests'
        elseif isdirectory(expand(root . '/src/app/tests'))
            let test_dir = 'src/app/tests'
        elseif isdirectory(expand(root . '/src/app/' . package_name . '/tests'))
            let test_dir = 'src/app/' . package_name . 'tests'
        endif

        if exists('l:src_dir') && exists('l:test_dir')
            call projectionist#append(root, {
                    \ '*': { 'path': src_dir . '/**' },
                    \ src_dir . '/*.py': {
                    \   'type': 'src',
                    \   'alternate': [
                    \     'tests/{dirname}/test_{basename}.py'
                    \   ],
                    \ }})

            call projectionist#append(root, {
                    \ '*': { 'path': test_dir . '/**' },
                    \ test_dir . '/**/test_*.py': {
                    \   'type': 'test',
                    \   'alternate': [
                    \     src_dir . '/{dirname}/{basename}.py'
                    \   ],
                    \ },
                    \ test_dir . '/**/*_test.py': {
                    \   'type': 'test',
                    \   'alternate': [
                    \     src_dir . '/{dirname}/{basename}.py'
                    \   ],
                    \ }})
        endif
    endfor
endfunction

autocmd User ProjectionistDetect call s:detect()
