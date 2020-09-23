set nocompatible
" use utf-8 encoding for vim(including gui and terminal)
set encoding=utf-8
" use utf-8 encoding for terminal vim
set termencoding=utf-8
" break between multi-byte character, for asian characters
set formatoptions+=m
" when join line, no space between mutli-byte characters
set formatoptions+=B
" Refer to https://vi.stackexchange.com/questions/27399/whats-t-te-and-t-ti-added-by-vim-8
set t_TE= t_TI=
" Highlight syntax for specified languages or configurations
syntax on
" automattically detect filetype and enable related plugin and indentation settings in runtimepath
filetype plugin indent on
" highlight search results
set hlsearch
" incremental search
set incsearch
" keep the same indentation as the first line, for ordinary file type
" set autoindent
" ex command, <Tab> completion
set wildmenu
" show line number and column number
set ruler
" 2 means always show status line
set laststatus=2
" show line number besides
set number
" read `vimrc` or `exrc` in the current directory
" set exrc
" make <BS> work more smoothly
set backspace=indent,eol,start
" Set tab size
set tabstop=4
" Set indenting size when use <, >, =
set shiftwidth=4
" Set space size if using spaces as tab
set softtabstop=4
" Use softtabstop spaces instead of tab character"
set expandtab
" when insert a bracket, instantaneously jump to the matching one
set showmatch
" highlight the text line of cursor
set cursorline
" highlight only the line number, not the line itself
set cursorlineopt=number
" hi CursorLine cterm=NONE ctermbg=Yellow ctermfg=DarkRed guibg=NONE
" change how to highlight line number
hi CursorLineNr cterm=NONE ctermbg=Yellow ctermfg=DarkRed guibg=NONE
" wrap long line
set wrap lbr
" show control characters
set list
" customize how to display control characters
set listchars=tab:➫\ ,eol:¶,trail:▮

"" matchit, since vim 6.0 it's built-in
packadd! matchit

""""""""""""""""""""""""""""""""""""
""""""""""""vim-plug""""""""""""""""
""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'itchyny/lightline.vim'
" Plug 'https://github.com/junegunn/vim-easy-align.git'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plug 'https://github.com/tpope/vim-fugitive.git'
" Plug 'https://github.com/mhinz/vim-signify.git'
" Plug 'https://github.com/tpope/vim-surround.git'
" Plug 'preservim/nerdcommenter'
" Plug 'luochen1990/rainbow'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'https://github.com/nathanaelkane/vim-indent-guides.git'
call plug#end()

"" ultisnips config
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader>e"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"" rainbow config
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle

"" nerdcommenter config
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

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

let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 et
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1

"" Disable auto comment
" It seems this only take affect if put at the last
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" set secure " Prohibit shell, write and other commands for security reason, best be put at the end
