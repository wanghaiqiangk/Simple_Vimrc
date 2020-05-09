"" 使用VIM按键，而非VI按键
set nocompatible

set exrc
set secure

"" highlight syntax, default
syntax on

"" Auto indent
set autoindent
set cindent
" Manually setup indentation
set cino+=g0

"" 在状态栏显示信息
"" 显示行号与列号
set ruler

"" 允许backspace处理indent, eol, etc.
set backspace=indent,eol,start

"" Options for tabs
set tabstop=4           "Set tab size
set shiftwidth=4        "Set indenting size when use <, >, =
set softtabstop=4       "Set space size if using spaces as tab
set expandtab           "Use softtabstop spaces instead of tab character"

"" Show line numbers
set number

"" 显示状态栏
set laststatus=2

"" Highlight search & Incremental search
set hlsearch
set incsearch

"" Show match, default
set showmatch

"" Hightlight current line
set cursorline
set cursorlineopt=number
hi CursorLine cterm=NONE ctermbg=yellow ctermfg=darkred guibg=NONE
hi CursorLineNR cterm=NONE ctermbg=yellow ctermfg=darkred guibg=NONE

"" Show newline character
set ffs=unix
set encoding=utf-8
set fileencoding=utf-8
set listchars=eol:¶
set list

"" matchit, since vim 6.0 it's built-in
packadd! matchit

""""""""""""""""""""""""""""""""""""
""""""""""""vim-plug""""""""""""""""
""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/jiangmiao/auto-pairs.git'
Plug 'https://github.com/junegunn/vim-easy-align.git'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'https://github.com/mhinz/vim-signify.git'
Plug 'https://github.com/tpope/vim-surround.git'
call plug#end()

"" NerdTree
map <f8> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=20

"" Signify config
set updatetime=100

"" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

"" YCM config
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
let g:ycm_min_num_of_chars_for_completion = 99
"let g:ycm_auto_trigger = 0
"let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_complete_in_strings=1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_auto_hover = 'no'
set completeopt-=preview

let g:ycm_semantic_triggers =  {
           \ 'c,cpp,python,java,go': ['re!\w{3}'],
           \ }

"" LeaderF config
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_ShowDevIcons = 0 " show icons but this may fail
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_StlColorscheme = 'powerline'
"let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 0
" let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_ShortcutF = "<C-x>f"
noremap <C-x>b :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

" search visually selected text literally
xnoremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap go :<C-U>Leaderf! rg --recall<CR>

"" Disable auto comment
" It seems this only take affect if put at the last
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"" Autopairs config
let g:AutoPairsShortcutToggle = "p"
""""""""""""""""""""""""""""""""""""
