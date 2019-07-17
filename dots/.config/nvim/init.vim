" My configuration for Neovim.
" Written by Tiger Sachse.


" *** LOAD VIM SETTINGS ***
source $HOME/.vimrc


" *** PLUGIN INITIALIZATION ***
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#rc('~/.config/nvim/bundle')
call vundle#begin()

" List of all active plugins.
Plugin 'udalov/kotlin-vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'terryma/vim-multiple-cursors'

call vundle#end()
filetype plugin indent on


" *** PLUGIN CONFIGURATION ***
" Configuration for 'multiple-cursors'.
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_prev_key = ''
let g:multi_cursor_start_key = ''
let g:multi_cursor_select_all_key = ''
let g:multi_cursor_next_key = 's'
let g:multi_cursor_skip_key = 'x'
let g:multi_cursor_quit_key = '<Esc>'
let g:multi_cursor_start_word_key = 's'
let g:multi_cursor_select_all_word_key = 'S'

" Configuration for 'lightline'.
set noshowmode
let g:lightline = {
    \ 'colorscheme' : 'jellybeans',
    \ }
