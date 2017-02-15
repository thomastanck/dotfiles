" Run :so % while editing this file or
" run :so ~/.vimrc to load the changes into vim.

set nocompatible

syntax enable
filetype plugin on

" ESC is pretty far away, C-c is easier to hit, especially with Capslock control
" key and Dvorak C being right on top of the right middle finger.
noremap <C-c> <ESC>

set keywordprg=":help"

set path+=**
set wildmenu
