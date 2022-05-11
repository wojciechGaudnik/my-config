" clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>

" ---------- split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ---------- tpope/vim-commentar
map  :Commentary<CR>
nnoremap <C-t> :RnvimrToggle<CR>

" ---------- resize with arrows
nnoremap <C-Up> :resize -2<CR>
nnoremap <C-Down> :resize +2resize with arrows<CR>
nnoremap <C-Left> :vertical resize +2<CR>
nnoremap <C-Right> :vertical resize -2<CR>

" ---------- navigate buffers
nnoremap <S-Left> :bprevious<CR>
nnoremap <S-Right> :bnext<CR>

" ---------- move text up/down
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" test
" test
" test
" test





echom 'from remaps.vim'

