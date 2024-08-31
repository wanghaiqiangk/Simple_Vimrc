function! Get_searching_direction()
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
