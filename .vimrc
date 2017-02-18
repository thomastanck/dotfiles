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

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Disable H and L
noremap h <NOP>
noremap l <NOP>

" ESC is pretty far away, C-c is easier to hit, especially with Capslock control
" key and Dvorak C being right on top of the right middle finger.
"noremap <C-c> <ESC>

set keywordprg=":help" " c_K runs this command on the word under the cursor

set path+=** " :find recursively into subdirectories.
set wildmenu " Show autocomplete options in a menu
set wildignore+=*.pyc " Don't autocomplete to *.pyc files

set so=3 " Show 3 lines of context when scrolling
set rnu  " Show relative line numbers on the left of the buffer

" Replay the q macro, which can be recorded with qq<macro>q
nnoremap <Space> @q
" Easier to type commands with enter key than with shift+;
nnoremap : <NOP>
nnoremap <Enter> :
nnoremap <Enter><Enter> :!

" Reordering lines
nnoremap <C-j> :m +1<Enter>
nnoremap <C-k> :m -2<Enter>