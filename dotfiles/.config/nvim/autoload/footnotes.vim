function! footnotes#Create(text) abort
    " Backup current value and type of the 'a' registers.
    let l:old_a_register_value = getreg('a')
    let l:old_a_register_type = getregtype('a')

    " Jump to the end of the file, find the number of the last footnote
    " and copy it into the 'a' register. We need to do this instead of just
    " suing a counter, since the user can manually add footnotes and remove
    " them, screwing up our count.
    let l:old_cursor_position = getcurpos()
    call cursor(9999999999, 0)
    if search('\[\^\d*\]', 'b') > 0
        silent execute 'normal! 2l"ayw'
    else
        call setreg('a', 0)
    endif

    " Create the footnote number with the copied value and make sure it's
    " unique. We'll keep increasing the footnote number until we find no
    " matches. This is important since the user could manually enter footnotes
    " with numbers which are not in order.
    let l:footnote_num = str2nr(getreg('a')) + 1
    while search('\[\^' . l:footnote_num . '\]', 'nw') > 0
        let l:footnote_num += 1
    endwhile

    " Restore the cursor position.
    call setpos('.', l:old_cursor_position)

    " Restore the previous value and type of the 'a' registers.
    call setreg('a', l:old_a_register_value, l:old_a_register_type)

    " Insert footnote at current position,
    silent execute 'normal! i[^' . l:footnote_num . ']'
    silent execute "normal! Go\<CR>\<ESC>: left\<CR>i[^" . l:footnote_num . "]: \<ESC>maa" . a:text . "\<ESC>`agU2l$"
    startinsert!
endfunction

function! footnotes#CreateOperator(type) abort
    " Delete the text from the motion.
    if a:0  " Invoked from Visual mode, use gv command.
        silent execute 'normal! gvdh'
    elseif a:type == 'line'
        silent execute "normal! '[V']dh"
    else
        silent execute "normal! `[v`]dh"
    endif

    " Remove any line breaks.
    let l:text = substitute(@@, '\n', ' ', 'g')

    " Call the create function to create the footnote.
    call footnotes#Create(l:text)
endfunction

function! footnotes#Jump() abort
    " Backup current value and type of the 'a' register.
    let l:old_register_value = getreg('a')
    let l:old_register_type = getregtype('a')

    " Copy footnote text into the 'a' register.
    silent execute 'normal! "aya['

    " Jump to text stored in the 'a' register.
    call search(escape(getreg('a'), '$.*/\[]'))

    " Restore the previous value and type of the 'a' register.
    call setreg('a', l:old_register_value, l:old_register_type)
endfunction
