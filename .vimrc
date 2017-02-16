" Run :so % while editing this file or
" run :so ~/.vimrc to load the changes into vim.

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
"filetype plugin on

" ESC is pretty far away, C-c is easier to hit, especially with Capslock control
" key and Dvorak C being right on top of the right middle finger.
noremap <C-c> <ESC>

set keywordprg=":help"

set path+=**
set wildmenu

set so=3
