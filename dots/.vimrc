" My configuration for Vim.
" Written by Tiger Sachse.


" *** GENERAL ***
set number
set mouse=a
set expandtab
set linebreak
set tabstop=4
set autoindent
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set fileformat=unix
set foldmethod=syntax
let loaded_matchparen=1
set clipboard=unnamedplus
filetype plugin indent on
autocmd vimLeave * set guicursor=a:hor50-blinkon1


" *** VISUALS ***
syntax on
colorscheme slate
set background=dark
highlight ColorColumn ctermbg=235
highlight Visual ctermfg=188 ctermbg=black
highlight Folded ctermfg=white ctermbg=236
highlight Search ctermfg=white ctermbg=black

if v:version > 703
    set cc=80
endif

" *** FILE SPECIFICS ***
autocmd FileType xml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType js setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
