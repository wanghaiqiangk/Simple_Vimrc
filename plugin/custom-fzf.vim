let g:fzf_vim = {}
let g:fzf_vim.buffers_jump = 1
let g:fzf_vim.commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_vim.tags_command = 'ctags -R'
let g:fzf_vim.commands_expect = 'alt-enter,ctrl-x'
let g:fzf_vim.preview_window = ['right,50%,<70(up,40%)', 'ctrl-/']
let g:fzf_history_dir = '~/.local/share/fzf-history'
let $FZF_DEFAULT_OPTS = '--bind=ctrl-p:up,ctrl-n:down,alt-p:previous-history,alt-n:next-history'

command! -bar -bang -nargs=? -complete=buffer Buffers
            \ call fzf#vim#buffers(
            \   <q-args>,
            \   fzf#vim#with_preview(
            \     {
            \       "options": ["--keep-right"],
            \       "placeholder": "{1}"
            \     }),
            \   <bang>0)
nnoremap <leader>ff :Files<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>fr :History<CR>
nnoremap <leader>s  :Rg<space>

function! s:list_buffers()
    redir => list
    silent ls
    redir END
    return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
    execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
            \ 'source': s:list_buffers(),
            \ 'sink*': { lines -> s:delete_buffers(lines)  },
            \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
            \ }))
nnoremap <leader>bd :BD<CR>
