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

        Plug 'preservim/nerdtree'
        Plug 'ryanoasis/vim-devicons'
        Plug 'pearofducks/ansible-vim'
        Plug 'sonph/onehalf', { 'rtp': 'vim' }
        Plug 'vim-airline/vim-airline'
        Plug 'frazrepo/vim-rainbow'
        Plug 'vim-airline/vim-airline-themes'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
"        Plug 'powerman/vim-plugin-autosess'
"        Plug 'sheerun/vim-polyglot'

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

" Theme oneHalfDark
syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'
highlight Comment cterm=NONE
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

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1
let g:airline_theme='dark'
"
" GitGutter
function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
set statusline+=%{GitStatus()}

" Configuration
hi Normal guibg=#111222
set encoding=UTF-8
set number relativenumber
set laststatus=2
set autoread
inoremap <C-\> <esc>:close<cr>               " <ctrl+4> close current window
nnoremap <C-\> :close<cr>

" setting horizontal and vertical splits
set splitbelow
set splitright


" Setting up indendation

au BufNewFile, BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile, BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2


" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" switching between opened files
nnoremap <C-Right> :bn<CR>
nnoremap <C-Left> :bp<CR>


