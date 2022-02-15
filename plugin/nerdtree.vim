"" NerdTree
nnoremap <f8> :NERDTreeFocus<CR>
let g:NERDTreeWinSize=20

augroup AutoNerd
    autocmd!
    autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
augroup END
