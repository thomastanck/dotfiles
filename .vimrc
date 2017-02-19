" Run :so % while editing this file or
" run :so ~/.vimrc to load the changes into vim.

set nocompatible
filetype off
set modelines=0

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'surround.vim' " Delete/change/add parentheses/quotes/XML-tags/much more with ease
Plugin 'repeat.vim' " Use . command with supported plugins

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
"filetype plugin on

" set hidden lets you close (as in hide) buffers without saving them
set hidden

" Make backspace work
set backspace=indent,eol,start

" Tab settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab

" statusline
set laststatus=2
set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Search options
set incsearch
set hlsearch
set ignorecase
set smartcase

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Disable H and L
nnoremap h <NOP>
nnoremap l <NOP>
" But enable them when it's really necessary,
" e.g. when deleting the second character of a word in vimtutor...
nnoremap <C-h> h
nnoremap <C-l> l

" ESC is pretty far away, C-c is easier to hit, especially with Capslock control
" key and Dvorak C being right on top of the right middle finger.
"noremap <C-c> <ESC>
" Apparently in visual-block mode, C-c doesn't apply changes to the other
" lines after using I.
vmap <C-c> <Esc>
imap <C-c> <Esc>

set keywordprg=":help" " c_K runs this command on the word under the cursor

set path^=** " :find recursively into subdirectories.
set wildmenu " Show autocomplete options in a menu
set wildignore+=*.pyc " Don't autocomplete to *.pyc files

set scrolloff=3 " Show 3 lines of context when scrolling
set relativenumber " Show relative line numbers on the left of the buffer
set number " Show line number of the current line

" Add fancy stuff to make tabs look cool and show trailing spaces and stuff.
set list
set listchars=
set listchars+=tab:>-
set listchars+=trail:~

" Replay the q macro, which can be recorded with qq<macro>q
nnoremap <Space> @q
" Easier to type commands with enter key than with shift+;
" nnoremap : <NOP>
nnoremap <Enter> :
nnoremap <Enter><Enter> :!
nnoremap <Enter><Enter><Enter> <Enter>
nnoremap <Enter>f<Space> :find 

" Reordering lines
nnoremap <C-j> :m +1<Enter>
nnoremap <C-k> :m -2<Enter>

" Code folding
set foldmethod=indent
set foldnestmax=10
" set nofoldenable
set foldlevel=0
