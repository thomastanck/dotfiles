:let mapleader = ","

" Disable arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Fast split resizing
nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Left> <C-w><
nnoremap <Right> <C-w>>

" Make j and k work on visual lines.
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

" ESC is pretty far away, C-c is easier to hit, especially with Capslock control
" key and Dvorak C being right on top of the right middle finger.
"noremap <C-c> <ESC>
" Apparently in visual-block mode, C-c doesn't apply changes to the other
" lines after using I.
vmap <C-c> <Esc>
imap <C-c> <Esc>

" Fast way of removing those annoying highlights
nnoremap <C-c> :noh<Enter><C-c>

" Replay the q macro, which can be recorded with qq<macro>q
nnoremap <Space> @q
" Easier to type commands with enter key than with shift+;
" nnoremap : <NOP>
nnoremap <Enter> :
nnoremap <Enter><Enter> :!
nnoremap <Enter><Enter><Enter> <Enter>
nnoremap <Enter>f<Space> :find 
vnoremap <Enter> :
vnoremap <Enter><Enter> :!
vnoremap <Enter><Enter><Enter> <Enter>

" Reordering lines
"nnoremap <C-j> :m +1<Enter>
"nnoremap <C-k> :m -2<Enter>

" Switching between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Toggle NERD Tree
nnoremap <silent> <Leader>n :NERDTreeFind<CR>
