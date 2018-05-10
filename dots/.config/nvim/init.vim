" Tiger Sachse's neovim configuration
" VUNDLE
set nocompatible
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#rc('~/.config/nvim/bundle')
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on

" COLORS
set t_Co=256
colorscheme slate
syntax on
hi ColorColumn ctermbg=235

" GENERAL
set number
set mouse=a
set encoding=utf-8
set fileformat=unix
set foldmethod=syntax

" CLIPBOARD
set clipboard=unnamedplus

" TABS
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

" PYTHON
au FileType python setlocal cc=80

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 0

let g:syntastic_error_symbol = "!!"
let g:syntastic_warning_symbol = "?"
hi SyntasticErrorSign ctermfg=red
hi SyntasticWarningSign ctermfg=yellow

set signcolumn=yes
highlight clear SignColumn
