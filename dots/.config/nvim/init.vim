execute pathogen#infect()

autocmd VimEnter * HeaderSetEmail tgsachse@gmail.com
autocmd VimEnter * HeaderSetUser tigermoo
autocmd VimEnter * HeaderSetArt ucf1

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
set laststatus=0
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
