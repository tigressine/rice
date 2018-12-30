" Tiger Sachse's neovim configuration
filetype plugin indent on

" GENERAL
set number
set mouse=a
set encoding=utf-8
set fileformat=unix
set foldmethod=indent
let loaded_matchparen=1

" COLORSCHEME
syntax on
colorscheme slate
highlight ColorColumn ctermbg=235
highlight StatusLine ctermfg=235 ctermbg=white
highlight Search ctermfg=white ctermbg=black
highlight Visual ctermfg=188 ctermbg=black

" CONFIGURE CLIPBOARD
set clipboard=unnamedplus

" MOVE WITH HJKL IN INSERT MODE
imap <a-h> <left>
imap <a-j> <down>
imap <a-k> <up>
imap <a-l> <right>

" USE SPACES INSTEAD OF TABS
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4

" FILE SPECIFIC SETTINGS
au FileType c setlocal cc=80
au FileType go setlocal cc=80
au FileType cpp setlocal cc=80
au FileType java setlocal cc=80
au FileType python setlocal cc=80
au FileType txt set spell spelllang=en_us
