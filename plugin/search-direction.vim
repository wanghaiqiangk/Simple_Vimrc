function! Get_searching_direction()
    " It's possible that these characters can't be rendered correctly
    " on your system. Ensure that the encoding of your environment is
    " set to UTF-8. If the issue persists, it could be due to the font
    " lacking support for certain Unicode characters.
    "
    " To address this, consider installing the 'fonts-noto' package on
    " Debian-based operating systems or seek equivalent packages for
    " your specific system. Refer to https://askubuntu.com/q/689607/1047030
    return v:searchforward == 1 ? "\U1F89B" : "\U1F899"
endfunction

let g:lightline = {
            \ 'active': {
            \ 'right': [ [ 'lineinfo' ],
            \            [ 'percent' ],
            \            [ 'searchdirection', 'fileformat', 'fileencoding', 'filetype' ] ]
            \ },
            \ 'component_function': {
            \   'searchdirection': 'Get_searching_direction'
            \ }
            \ }
