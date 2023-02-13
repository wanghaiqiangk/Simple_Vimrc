"" NerdTree
nnoremap <f8> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=20

augroup AutoNerd
    autocmd!
    autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
augroup END
