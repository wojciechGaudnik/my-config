" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

"        Plug 'itchyny/lightline.vim'
        Plug 'ryanoasis/vim-devicons'
        Plug 'pearofducks/ansible-vim'
        Plug 'powerman/vim-plugin-autosess'
        Plug 'preservim/nerdtree'
        Plug 'sonph/onehalf', { 'rtp': 'vim' }
	      Plug 'sheerun/vim-polyglot'
	      Plug 'frazrepo/vim-rainbow'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'

call plug#end()

" NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeWinPos = "left"

"Theme oneHalfDark
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
highlight Comment cterm=NONE
" " lightline
" " let g:lightline = { 'colorscheme': 'onehalfdark' }
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let s:is_transparent = 0
function! Toggle_transparent()
    if s:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let s:is_transparent = 1
     else
        hi Normal ctermbg=236
        hi Normal guibg=#111222
        let s:is_transparent = 0
     endif
 endfunction
 nnoremap <C-x>t : call Toggle_transparent()<CR>

" Rainbow brackets
let g:rainbow_active = 1


" Configuration
hi Normal guibg=#111222
set encoding=UTF-8
set number relativenumber
set laststatus=2
set autoread
inoremap <C-\> <esc>:close<cr>               " <ctrl+4> close current window
nnoremap <C-\> :close<cr>


" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

