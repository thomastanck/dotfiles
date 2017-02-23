" Run :so % while editing this file or
" run :so ~/.vimrc to load the changes into vim.

" Absolute bare minimum
set nocompatible
filetype off
set modelines=0

scriptencoding utf-8
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'surround.vim' " Delete/change/add parentheses/quotes/XML-tags/much more with ease
Plugin 'repeat.vim' " Use . command with supported plugins

Plugin 'vim-airline/vim-airline'

Plugin 'tpope/vim-fugitive' " Git integration

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
"filetype plugin on

" vim-airline
set t_Co=256
let g:airline_powerline_fonts = 1

let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#branch#enabled=1

" set colour scheme
colorscheme desert

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
noh " Plugins like to activate search somehow...

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
"	hah	haha	ha			hah   

" Code folding
set foldmethod=indent
set foldnestmax=10
" set nofoldenable
set foldlevel=0

" Source remappings
source ~/.vim/usr/remap.vim
