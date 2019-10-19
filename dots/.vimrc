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
highlight Define ctermfg=4
highlight Statement ctermfg=4
highlight StorageClass ctermfg=4
highlight Structure ctermfg=4
highlight vimCondHL ctermfg=4
highlight vimSubst ctermfg=4
highlight xmlTag ctermfg=4
highlight xmlTagName ctermfg=4
highlight xmlEndTag ctermfg=4

" *** CYAN COLORED ITEMS ***
highlight Define ctermfg=6
highlight Function ctermfg=6
highlight Include ctermfg=6
highlight Constant ctermfg=6

" *** RED COLORED ITEMS ***
highlight Error ctermfg=1 ctermbg=0
highlight ErrorMsg ctermfg=1 ctermbg=0
highlight Identifier ctermfg=1
highlight Operator ctermfg=1
highlight Special ctermfg=1
highlight Type ctermfg=1
highlight vimMarkNumber ctermfg=1
highlight vimSep ctermfg=1
highlight WarningMsg ctermfg=1

" *** ODDBALL COLORED ITEMS ***
highlight ColorColumn ctermbg=0
highlight User1 ctermbg=0
highlight DiffText ctermfg=white ctermbg=1
highlight Folded ctermfg=white ctermbg=0
highlight IncSearch ctermfg=0 ctermbg=white
highlight Search ctermfg=white ctermbg=0 cterm=underline
highlight SpellBad ctermfg=white ctermbg=1
highlight TermCursor ctermfg=white ctermbg=0
highlight Visual ctermfg=white ctermbg=0

let g:MODES={
  \'n' : [' NORMAL ', 1, 0],
  \'no' : [' PENDING ', 9, 9],
  \'v' : [' VISUAL ', 2, 0],
  \'V' : [' VISUAL-LINE ', 9, 9],
  \'\<C-V>' : [' VISUAL-BLOCK ', 9, 9],
  \'s' : [' SELECT ', 9, 9],
  \'S' : [' SELECT-LINE ', 9, 9],
  \'\<C-S>' : [' SELECT-BLOCK ', 9, 9],
  \'i' : [' INSERT ', 9, 9],
  \'R' : [' REPLACE ', 3, 0],
  \'Rv' : [' VIRTUAL-REPLACE ', 9, 9],
  \'c' : [' COMMAND ', 9, 9],
  \'cv' : [' VIM-EX ', 9, 9],
  \'ce' : [' NORMAL-EX ', 9, 9],
  \'r' : [' PROMPT ', 9, 9],
  \'rm' : [' MORE ', 9, 9],
  \'r?' : [' QUERY ', 9, 9],
  \'!' : [' SHELL ', 9, 9],
  \'t' : [' TERMINAL ', 9, 9]
\}

function! UpdateUser1Color(givenMode)
  if has_key(g:MODES, a:givenMode)
    exe printf(
      \'hi User1 ctermfg=%s ctermbg=%s',
      \g:MODES[a:givenMode][1],
      \g:MODES[a:givenMode][2]
    \)
  endif

  return ''
endfunction

" HIDE --INSERT-- and the other ones
" dont bork status line when an error occurs
" figure color out


"function! ReadOnly()
"  if &readonly || !&modifiable
"    return ''
"  else
"    return ''
"endfunction

" *** STATUS LINE ***
set statusline=%#ColorColumn#
"set statusline+=%{UpdateUser1Color(mode())}
set statusline+=%#User1#
set statusline+=%{g:MODES[mode()][0]}
set statusline+=%#ColorColumn#
set statusline+=\ %f
set statusline+=%=
set statusline+=%l:%c\ %p%%\ \[%{&fileformat}\]\ 

" *** FILE SPECIFICS ***
autocmd FileType c autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType cpp autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType go autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType html autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType vim setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType java autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType javascript autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType kotlin autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType python autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType ruby autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType sh autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType xml autocmd BufWritePre <buffer> %s/\s\+$//e
autocmd FileType xml setlocal tabstop=2 shiftwidth=2 softtabstop=2
