" COMPLETE NEOVIM CONFIGURATION

" VUNDLE SETUP
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#rc('~/.config/nvim/bundle')
call vundle#begin()

Plugin 'w0rp/ale'
Plugin 'junegunn/goyo.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()
filetype plugin indent on

" GENERAL STUFF
set number
set mouse=a
set encoding=utf-8
set fileformat=unix
set foldmethod=syntax
let loaded_matchparen=1

" COLORS!
syntax on
colorscheme slate
set background=dark
highlight ColorColumn ctermbg=235
highlight Visual ctermfg=188 ctermbg=black
highlight Folded ctermfg=white ctermbg=236
highlight Search ctermfg=white ctermbg=black

" USE THE SYSTEM CLIPBOARD
set clipboard=unnamedplus

" MOVE WITH hjkl IN INSERT MODE
imap <a-k> <up>
imap <a-h> <left>
imap <a-j> <down>
imap <a-l> <right>

" SCROLL FASTER
nmap <a-j> <c-d>
nmap <a-k> <c-u>

" REDO SHOULD BE r
nmap r <c-r>

" USE SPACES INSTEAD OF TABS
set tabstop=4
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4

" FILE SPECIFIC SETTINGS
autocmd FileType c setlocal cc=80
autocmd FileType go setlocal cc=80
autocmd FileType cpp setlocal cc=80
autocmd FileType java setlocal cc=80
autocmd FileType python setlocal cc=80
autocmd Filetype text setlocal spell
autocmd Filetype text setlocal linebreak

" PLUGIN CONFIGURATIONS

" GITGUTTER
set updatetime=100
if exists('&signcolumn')
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" MULTIPLE CURSORS
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_prev_key = ''
let g:multi_cursor_start_key = ''
let g:multi_cursor_select_all_key = ''
let g:multi_cursor_next_key = 's'
let g:multi_cursor_skip_key = 'x'
let g:multi_cursor_quit_key = '<Esc>'
let g:multi_cursor_start_word_key = 's'
let g:multi_cursor_select_all_word_key = 'S'

" LIGHTLINE
set noshowmode
let g:lightline = {
    \ 'colorscheme' : 'jellybeans',
    \ }

" SIMPYLFOLD
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0

" ALE
let g:ale_sign_error = '!'
let g:ale_sign_warning = '?'
let g:ale_set_highlights = 0
highlight clear ALEErrorSign
highlight clear ALEWarningSign
highlight ALEErrorSign ctermfg=red
highlight ALEWarningSign ctermfg=yellow
let g:ale_lint_on_text_changed = 'never'

" GOYO
let g:goyo_width = 90
let g:goyo_height = 90
