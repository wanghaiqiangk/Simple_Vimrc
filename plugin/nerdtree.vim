"" NerdTree
nnoremap <f8> :NERDTreeFocus<CR>
let g:NERDTreeWinSize=20

augroup AutoNerd
    autocmd!
    autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
augroup END
