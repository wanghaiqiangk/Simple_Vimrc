nnoremap <silent> <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <silent> <leader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[y`]
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen

    let number_of_results = len(getqflist())
    echo number_of_results . " results found."
    redraw

    let @@ = saved_unnamed_register
endfunction
