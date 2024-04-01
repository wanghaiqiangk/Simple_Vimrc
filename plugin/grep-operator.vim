nnoremap <silent> <leader>g :set operatorfunc=GrepOperator<cr>g@
vnoremap <silent> <leader>g :<c-u>call GrepOperator(visualmode())<cr>

function! GrepOperator(type)
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen

    let number_of_results = len(getqflist())
    echom number_of_results . " results found."
endfunction
