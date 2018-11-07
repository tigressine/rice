" Tiger Sachse's neovim configuration
" VUNDLE
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#rc('~/.config/nvim/bundle')
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'chriskempson/base16-vim'
"Plugin 'vim-syntastic/syntastic'
"Plugin 'terryma/im-multiple-cursors'

call vundle#end()
filetype plugin indent on

" GENERAL
set number
set mouse=a
set encoding=utf-8
set fileformat=unix
set foldmethod=syntax
let loaded_matchparen=1

" COLORSCHEME
syntax on
colorscheme slate
hi ColorColumn ctermbg=235
hi Normal ctermbg=NONE
hi LineNr ctermbg=NONE

" CLIPBOARD
set clipboard=unnamedplus

" MOVE WITH HJKL IN INSERT MODE
imap <a-h> <left>
imap <a-j> <down>
imap <a-k> <up>
imap <a-l> <right>

" SCROLL FASTER
nmap <a-j> <c-d>
nmap <a-k> <c-u>

" TABS
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4

" PYTHON
au FileType python setlocal cc=80

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'issues' ] ]
      \ },
      \ }
