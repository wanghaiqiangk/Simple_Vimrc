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
    set listchars=tab:➫\ ,trail:▮

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

" Affect async update time
set updatetime=100
" Always show sign column
set signcolumn=yes

" Key mappings
nnoremap <silent> <leader>cd :lcd %:h<CR>:pwd<CR>
nnoremap <silent> <C-n> :noh<CR>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h')..'/' : '%%'
inoremap <c-u> <esc>gUiwA

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

if !has('nvim')
    " Vim
    set cscopetag
    set cscopetagorder=1
    nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    nnoremap <leader>sv :source $MYVIMRC<cr>
else
    " NeoVim
    nnoremap <leader>ev :vsplit ~/.vimrc<cr>
    nnoremap <leader>sv :source ~/.vimrc<cr>
endif

""""""""""""""""""""""""""""""""""""
""""""""""""vim-plug""""""""""""""""
""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'preservim/nerdcommenter'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/vim-easy-align'
Plug 'luochen1990/rainbow'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nathanaelkane/vim-indent-guides'
if executable("go")
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
endif
Plug 'preservim/tagbar'
Plug 'cdelledonne/vim-cmake'
Plug 'lifepillar/vim-solarized8'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Colorscheme {{{
" see https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
augroup MyColors
    autocmd!
    " change how to highlight line number
    autocmd ColorScheme * highlight CursorLineNr cterm=NONE ctermbg=Yellow ctermfg=DarkRed gui=NONE guifg=DarkRed guibg=Yellow
                \ | highlight SignColumn ctermbg=NONE cterm=NONE guibg=NONE gui=NONE
                \ | highlight GitGutterAdd    guifg=#009900 ctermfg=2
                \ | highlight GitGutterChange guifg=#bbbb00 ctermfg=3
                \ | highlight GitGutterDelete guifg=#ff2222 ctermfg=1
augroup END

colorscheme default

" True color. See also xterm-true-color
" set termguicolors
" let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
" let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
set t_Co=256
" }}}

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-rename)
" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

let s:myfonts = ["Fira Mono"]
let s:myfontsize = 18
function! IncreaseFontSize(inc)
    let s:myfontsize += a:inc
    let &guifont = s:myfonts[0] .. ":h" .. s:myfontsize
endfunction
function! DecreaseFontSize(dec)
    let s:myfontsize += a:dec
    let &guifont = s:myfonts[0] .. ":h" .. s:myfontsize
endfunction

if exists("g:neovide")
    " Put configurations specific to neovide
    set guifont=Fira\ Mono:h18
    nnoremap <silent> <C-ScrollWheelUp> :call DecreaseFontSize(-1)<CR>
    nnoremap <silent> <C-ScrollWheelDown> :call IncreaseFontSize(1)<CR>
endif

augroup MyAutoCmd
    autocmd!
    "" Disable auto comment
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" set secure " Prohibit shell, write and other commands for security reason, best be put at the end
