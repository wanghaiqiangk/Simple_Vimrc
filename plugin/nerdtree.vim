let NERDTreeQuitOnOpen=1

nnoremap <silent> <leader>ee :NERDTreeToggle<CR>
nnoremap <silent> <leader>ef :NERDTreeFind<CR>

augroup AutoNerd
    autocmd!
    if exists("g:loaded_nerd_tree")
        autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
    endif
augroup END
