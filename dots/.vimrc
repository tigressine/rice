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
if v:version > 703
    set cc=80
endif

" *** BLACK COLORED ITEMS ***
highlight ColorColumn ctermbg=0

" *** DARK GREEN COLORED ITEMS ***
highlight Type ctermfg=2
highlight String ctermfg=2
highlight MoreMsg ctermfg=2
highlight vimSyncC ctermfg=2
highlight SpecialKey ctermfg=2
highlight vimHiGuiFont ctermfg=2

" *** DARK YELLOW COLORED ITEMS ***
highlight LineNr ctermfg=3

" *** YELLOW COLORED ITEMS ***
highlight Comment ctermfg=11

" *** DARK ORANGE COLORED ITEMS ***
highlight Type ctermfg=6
highlight vimSep ctermfg=6
highlight Special ctermfg=6
highlight Constant ctermfg=6
highlight Function ctermfg=6
highlight vimMarkNumber ctermfg=6

" *** BLUE COLORED ITEMS ***
highlight vimSubst ctermfg=12
highlight vimCondHL ctermfg=12
highlight Statement ctermfg=12
highlight Structure ctermfg=12
highlight StorageClass ctermfg=12

" *** RED COLORED ITEMS ***
highlight Include ctermfg=9
highlight Operator ctermfg=9
highlight Identifier ctermfg=9
highlight WarningMsg ctermfg=9

" *** INVERTED ITEMS ***
highlight Error ctermfg=white ctermbg=1
highlight Search ctermfg=white ctermbg=0
highlight Folded ctermfg=white ctermbg=0
highlight Visual ctermfg=white ctermbg=0
highlight ErrorMsg ctermfg=white ctermbg=1
highlight DiffText ctermfg=white ctermbg=1
highlight SpellBad ctermfg=white ctermbg=1
highlight IncSearch ctermfg=0 ctermbg=white
highlight TermCursor ctermfg=white ctermbg=0

" *** FILE SPECIFICS ***
autocmd FileType xml setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType js setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
