" use vim, not vi keybinds
set nocompatible
" highlight syntax, default
set syntax=on
" Auto indent
set autoindent
" Tab length
set tabstop=4
" Show line numbers
set number
" Highlight search
set hlsearch
" Show match, default
set showmatch
" Hightlight current line
set cursorline
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
" Plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'https://github.com/scrooloose/nerdtree.git'
Plugin 'https://github.com/jiangmiao/auto-pairs.git'
call vundle#end()
" NerdTree
map <F9> :NERDTreeToggle<CR>
map <F10> <C-w><C-w>
" Incremental search
set incsearch
" Show newline character
set ffs=unix
set encoding=utf-8
set fileencoding=utf-8
set listchars=eol:¶
set list
