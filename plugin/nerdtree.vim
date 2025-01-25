let NERDTreeQuitOnOpen=1

nnoremap <silent> <leader>ee :NERDTreeToggle<CR>
nnoremap <silent> <leader>ef :NERDTreeFind<CR>

augroup AutoNerd
    autocmd!
    autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
augroup END
