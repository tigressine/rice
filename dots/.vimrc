" My configuration for Vim.
" Written by Tiger Sachse.

" *** GENERAL ***
set number
if exists('&mouse')
    set mouse=a
endif
set expandtab
set linebreak
set tabstop=4
set autoindent
set shiftwidth=4
set softtabstop=4
set encoding=utf-8
set fileformat=unix
if exists('&foldmethod')
    set foldmethod=syntax
endif
let loaded_matchparen=1
set clipboard=unnamedplus
filetype plugin indent on
autocmd vimLeave * set guicursor=a:hor50-blinkon1

" *** VISUALS ***
syntax on
colorscheme slate
set background=dark
if exists('&cc')
    set cc=80
endif

" *** BLACK COLORED ITEMS ***
highlight ColorColumn ctermbg=0

" *** GREEN COLORED ITEMS ***
highlight MoreMsg ctermfg=2
highlight SpecialKey ctermfg=2
highlight String ctermfg=2
highlight Type ctermfg=2
highlight vimHiGuiFont ctermfg=2
highlight vimSyncC ctermfg=2

" *** ORANGE COLORED ITEMS ***
highlight Comment ctermfg=3 cterm=italic
highlight LineNr ctermfg=3

" *** BLUE COLORED ITEMS ***
highlight Define ctermfg=5
highlight Statement ctermfg=5
highlight StorageClass ctermfg=5
highlight Structure ctermfg=5
highlight vimCondHL ctermfg=5
highlight vimSubst ctermfg=5

" *** RED COLORED ITEMS ***
highlight Constant ctermfg=9
highlight Error ctermfg=9 ctermbg=0
highlight ErrorMsg ctermfg=9 ctermbg=0
highlight Function ctermfg=9
highlight Identifier ctermfg=9
highlight Include ctermfg=9
highlight Operator ctermfg=9
highlight Special ctermfg=9
highlight Type ctermfg=9
highlight vimMarkNumber ctermfg=9
highlight vimSep ctermfg=9
highlight WarningMsg ctermfg=9

" *** INVERTED ITEMS ***
highlight DiffText ctermfg=white ctermbg=1
highlight Folded ctermfg=white ctermbg=0
highlight IncSearch ctermfg=0 ctermbg=white
highlight Search ctermfg=white ctermbg=0 cterm=underline
highlight SpellBad ctermfg=white ctermbg=1
highlight TermCursor ctermfg=white ctermbg=0
highlight Visual ctermfg=white ctermbg=0

" *** FILE SPECIFICS ***
autocmd FileType c autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType cpp autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType go autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType html autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType java autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType javascript autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType kotlin autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType python autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType ruby autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType sh autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType vim autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType xml autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType xml setlocal tabstop=2 shiftwidth=2 softtabstop=2
