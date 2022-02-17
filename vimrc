function! BetterDefaults() abort
    " show line number besides
    set number
    " highlight the text line of cursor
    set cursorline
    " highlight only the line number, not the line itself
    set cursorlineopt=number

    " see https://www.reddit.com/r/vim/wiki/tabstop
    set tabstop=8
    set softtabstop=4
    set shiftwidth=4
    set expandtab

    " show line number and column number
    set ruler
    " 2 means always show status line
    set laststatus=2

    " make <BS> work more smoothly
    set backspace=indent,eol,start

    " Highlight syntax for specified languages or configurations
    syntax on

    " automattically detect filetype and enable related plugin and indentation settings in runtimepath
    set autoindent
    filetype plugin indent on

    set ignorecase
    set hlsearch
    set incsearch

    " ex command, <Tab> completion
    set wildmenu
    set wildmode=longest:full,full

    " wrap long line
    set wrap lbr

    " show control characters
    set list
    " customize how to display control characters
    set listchars=tab:➫\ ,eol:¶,trail:▮

    " when insert a bracket, instantaneously jump to the matching one
    set showmatch
    " Extend default % functionality
    packadd! matchit

    " Show search index, also check vim-searchindex plugin
    set shortmess-=S

    " Refer to https://vi.stackexchange.com/questions/27399/whats-t-te-and-t-ti-added-by-vim-8
    set t_TE= t_TI=
endfunction

call BetterDefaults()

" use utf-8 encoding for vim(including gui and terminal)
set encoding=utf-8
" use utf-8 encoding for terminal vim
set termencoding=utf-8
" break between multi-byte character, for asian characters
set formatoptions+=m
" when join line, no space between mutli-byte characters
set formatoptions+=B

" see https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
augroup MyColors
    autocmd!
    " change how to highlight line number
    autocmd ColorScheme * highlight CursorLineNr cterm=NONE ctermbg=Yellow ctermfg=DarkRed guibg=NONE
                \ | highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
augroup END

colorscheme default

" better display in tmux
set background=dark
set t_Co=256

" Affect async update time
set updatetime=100


""""""""""""""""""""""""""""""""""""
""""""""""""vim-plug""""""""""""""""
""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension'  }
Plug 'mileszs/ack.vim'
" Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'preservim/nerdcommenter'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'tpope/vim-fugitive'
" Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'Valloric/YouCompleteMe', { 'branch': 'legacy-c++11', 'do': './install.py --clangd-completer' }
" Plug 'itchyny/lightline.vim'
" Plug 'https://github.com/junegunn/vim-easy-align.git'
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plug 'luochen1990/rainbow'
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

augroup MyAutoCmd
    autocmd!
    "" Disable auto comment
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END
" set secure " Prohibit shell, write and other commands for security reason, best be put at the end

