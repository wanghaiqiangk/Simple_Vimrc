let g:ycm_auto_trigger = 1
let g:ycm_auto_hover = ''
let g:ycm_show_diagnostics_ui = 0
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_extra_conf_vim_data = []
let g:ycm_server_python_interpreter = ''
let g:ycm_keep_logfiles = 0
let g:ycm_server_log_level = 'info'
let g:ycm_add_preview_to_completeopt = "popup"
let g:ycm_global_ycm_extra_conf = ''
let g:ycm_confirm_extra_conf = 1

let g:ycm_use_clangd = 1
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
let g:ycm_clangd_binary_path = exepath("clangd")

" YCM semantic-based configs
let g:ycm_max_num_candidates = 50
let g:ycm_key_invoke_completion = '<C-Space>'

" YCM identifier-based configs
let g:ycm_min_num_of_chars_for_completion = 99
let g:ycm_max_num_identifier_candidates = 10

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go': ['re!\w{3}'],
           \ }

nnoremap <leader>yy :YcmCompleter 
nmap <leader>. <Plug>(YCMHover)

augroup YCMDocCustom
    autocmd!
    autocmd FileType c,cpp let b:ycm_hover = {
                \ 'command': 'GetDoc',
                \ 'syntax': &filetype
                \ }
    autocmd FileType c,cpp,python nmap <silent> gd :YcmCompleter GoTo <C-R><C-W><CR>
                \ | nmap <silent> gD :YcmCompleter GoToReferences <C-R><C-W><CR>
augroup END
