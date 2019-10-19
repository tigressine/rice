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
set noshowmode
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
highlight User1 ctermfg=0 ctermbg=0
highlight DiffText ctermfg=white ctermbg=1
highlight Folded ctermfg=white ctermbg=0
highlight IncSearch ctermfg=0 ctermbg=white
highlight Search ctermfg=white ctermbg=0 cterm=underline
highlight SpellBad ctermfg=white ctermbg=1
highlight TermCursor ctermfg=white ctermbg=0
highlight Visual ctermfg=white ctermbg=0

" *** STATUS LINE ***
let s:MODES={
  \'default' : ['  NONE ', 0, 3],
  \'n' : ['  NORMAL ', 0, 3],
  \'no' : ['  PENDING ', 0, 3],
  \'v' : ['  VISUAL ', 0, 1],
  \'V' : ['  VISUAL-LINE ', 0, 1],
  \"\<C-V>" : ['  VISUAL-BLOCK ', 0, 1],
  \'s' : ['  SELECT ', 0, 1],
  \'S' : ['  SELECT-LINE ', 0, 1],
  \"\<C-S>" : ['  SELECT-BLOCK ', 0, 1],
  \'i' : ['  INSERT ', 0, 2],
  \'R' : ['  REPLACE ', 0, 5],
  \'Rv' : ['  VIRTUAL-REPLACE ', 0, 5],
  \'c' : ['  COMMAND ', 0, 6],
  \'cv' : ['  VIM-EX ', 0, 6],
  \'ce' : ['  NORMAL-EX ', 0, 6],
  \'r' : ['  PROMPT ', 0, 9],
  \'rm' : ['  MORE ', 0, 9],
  \'r?' : ['  QUERY ', 0, 9],
  \'!' : ['  SHELL ', 0, 9],
  \'t' : ['  TERMINAL ', 0, 9]
\}

function! GetModeName(mode)
  if has_key(s:MODES, a:mode)
    return s:MODES[a:mode][0]
  else
    return s:MODES['default'][0]
  endif
endfunction

function! SetUser1Color(mode)
  if has_key(s:MODES, a:mode)
    exe 'hi! User1 ctermfg='
      \ . s:MODES[a:mode][1]
      \ . ' ctermbg='
      \ . s:MODES[a:mode][2]
      \ . ' cterm=bold'
  else
    exe 'hi! User1 ctermfg='
      \ . s:MODES['default'][1]
      \ . 'ctermbg='
      \ . s:MODES['default'][2]
      \ . ' cterm=bold'
  endif
  return ''
endfunction

function! GetModificationFlags()
  if (&readonly || !&modifiable) && &modified
    return '[RO, +] '
  elseif &readonly || !&modifiable
    return '[RO] '
  elseif &modified
    return '[+] '
  else
    return ''
  endif
endfunction

set statusline=%#ColorColumn#
set statusline+=%{SetUser1Color(mode())}
set statusline+=%#User1#
set statusline+=%{GetModeName(mode())}
set statusline+=%#ColorColumn#
set statusline+=\ %f
set statusline+=%=
set statusline+=%{GetModificationFlags()} 
set statusline+=%l:%c\ %p%%\ %y\ 

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
