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
Plugin 'VundleVim/Vundle.vim'
Plugin 'itchyny/lightline.vim'
call vundle#end()
filetype plugin indent on

" *** NVIM-SPECIFIC COLORS ***
highlight NvimDict ctermfg=6
highlight nvimMap ctermfg=12
highlight NvimDict ctermfg=9
highlight NvimComparison ctermfg=9

" *** LIGHTLINE CONFIGURATION ***
set noshowmode
let g:lightline = {
    \ 'colorscheme' : 'seoul256',
    \ }
