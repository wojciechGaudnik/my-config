" clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" nnoremap <CTRL-T> :RnvimrToggle<CR>
nnoremap <C-t> :echo 'test'<CR>
map <F2> :echo 'test'<CR>
echom 'from remaps.vim'
