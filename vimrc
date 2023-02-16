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
    set smartcase
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

    " set autochdir

    inoremap <CR> <C-]><C-G>u<CR>

    set hidden
endfunction

function! GetSysVersion()
    let os=substitute(system('uname'), '\n', '', '')
    if os == 'Darwin' || os == 'Mac'
        let sys_version=substitute(system('sw_vers -productVersion'), '\n', '', '')
    elseif os == 'Linux'
        let sys_version=substitute(system('lsb_release -rs'), '\n', '', '')
    endif
    return sys_version
endfunction

" Change leader key
nnoremap <SPACE> <Nop>
let mapleader = " "

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

nnoremap <leader>cd :lcd %:h<CR>

set cscopetag
set cscopetagorder=1
set statusline=%<%{getcwd()}\ \|\ %<%f%y\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" quickfix
nnoremap <S-F1>  :cc<CR>
nnoremap <F2>    :cnext<CR>
nnoremap <S-F2>  :cprev<CR>
nnoremap <F3>    :cnfile<CR>
nnoremap <S-F3>  :cpfile<CR>
nnoremap <F4>    :cfirst<CR>
nnoremap <S-F4>  :clast<CR>

""""""""""""""""""""""""""""""""""""
""""""""""""vim-plug""""""""""""""""
""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/ervandew/supertab'
Plug 'preservim/nerdtree'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension'  }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
" Plug 'junegunn/fzf.vim'
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
if GetSysVersion() <=# "16.04"
    Plug 'ycm-core/YouCompleteMe', { 'branch': 'legacy-c++11', 'do': './install.py --clangd-completer' }
else
    Plug 'ycm-core/YouCompleteMe', { 'do': './install.py --clangd-completer' }
endif
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
" Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nathanaelkane/vim-indent-guides'
if executable("go")
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
endif
call plug#end()

let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

augroup MyAutoCmd
    autocmd!
    "" Disable auto comment
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END
" set secure " Prohibit shell, write and other commands for security reason, best be put at the end

