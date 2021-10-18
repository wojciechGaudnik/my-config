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
        Plug 'frazrepo/vim-rainbow'
        Plug 'sonph/onehalf', { 'rtp': 'vim' }
	Plug 'relastle/bluewery.vim'	
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	
        Plug 'pearofducks/ansible-vim'
	Plug 'Yggdroot/indentLine'
	Plug 'aserebryakov/vim-todo-lists'
	
	Plug 'vim-syntastic/syntastic'
	Plug 'christoomey/vim-tmux-navigator'
	
"        Plug 'powerman/vim-plugin-autosess'
"        Plug 'sheerun/vim-polyglot'

call plug#end()

" ---------- CONFIGURATION  -------------------------------------------------
syntax on
set t_Co=256
set cursorline
set encoding=UTF-8
set number relativenumber
set laststatus=2
set autoread
set splitbelow
set splitright
" set up cursor 
set ttimeout
set ttimeoutlen=1
set ttyfast
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
let &t_SR = "\e[3 q"
" <ctrl+4> close current window
inoremap <C-\> <esc>:q<cr>               
nnoremap <C-\> :q<cr>
"autocmd BufEnter *.txt hi Normal guibg=Black
" <ctrl+s> save current window
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

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
" resize window
nnoremap <C-w>h :vertical resize -5<CR>
nnoremap <C-w>l :vertical resize +5<CR>
nnoremap <C-w>j :resize +5<CR>
nnoremap <C-w>k :resize -5<CR>
" ansible colors
function! Ansible_colors()
    hi ansible_attributes guifg=#00afff
    hi ansible_name guifg=#00afff
    hi ansible_debug_keywords guifg=#00afff
    hi ansible_extra_special_keywords guifg=#00afff
    hi ansible_normal_keywords guifg=#00afff
    hi ansible_loop_keywords guifg=#00afff
endfunction



" ---------- NERDTree preservim/nerdtree -------------------------------------------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
"&buftype ==# 'quickfix' 
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let g:NERDTreeWinPos = "left"
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'i'
" ---------- Devicons ryanoasis/vim-devicons --------------------------------------------------
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

" ---------- Rainbow brackets frazrepo/vim-rainbow ------------------------------------------
au BufReadPost,BufNewFile *.c,*.cpp,*.java,*.md,*.txt,*.py,.vimrc RainbowLoad


" ---------- Theme oneHalfDark sonph/onehalf ------------------------------------------
silent! colorscheme onehalfdark
hi Comment cterm=NONE
hi Normal ctermbg=233 guibg=#121212
hi Identifier guifg=#dcdfe4
call Ansible_colors()
let g:airline_theme='onehalfdark'
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let s:is_transparent = 1
function! Toggle_transparent()
    if s:is_transparent == 1
	colorscheme bluewery
	colorscheme green_dark
	hi Comment guifg=#808080
        hi Normal guibg=NONE ctermbg=NONE
	hi Identifier guifg=#dcdfe4
	call Ansible_colors()
	RainbowLoad
        let s:is_transparent = 0
     else
	colorscheme onehalfdark
	hi Comment cterm=NONE
	hi Normal ctermbg=233 guibg=#121212
	hi Identifier guifg=#dcdfe4
	call Ansible_colors()
	RainbowLoad
        let s:is_transparent = 1
     endif
endfunction
nnoremap <C-x>t : call Toggle_transparent()<CR>

" ---------- Air-line vim-airline/vim-airline ------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled=1
let g:airline_theme='dark'

" ---------- GitGutter airblade/vim-gitgutter ------------------------------------------
if (exists("*GitGutterGetHunkSummary"))
	function! GitStatus()
	  let [a,m,r] = GitGutterGetHunkSummary()
	  return printf('+%d ~%d -%d', a, m, r)
	endfunction
	set statusline+=%{GitStatus()}
endif

" ---------- Ansible pearofducks/ansible-vim -----------------------------------------
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
"au BufRead,BufNewFile */playbooks/*.yml colorscheme default
let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "od"
let g:ansible_name_highlight = "b"

let g:ansible_extra_keywords_highlight = 1
let g:ansible_normal_keywords_highlight = 'Constant'
let g:ansible_with_keywords_highlight = 'Constant'
let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }
"
" ---------- IndentLine Yggdroot/indentLine ------------------------------------------------
au BufRead,BufNewFile */playbooks/*.yml IndentLinesEnable

" ---------- Syntastic vim-syntastic/syntastic ------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"autocmd WinEnter * if &buftype ==# 'quickfix' && winnr('$') == 1 | quit | endif
let g:syntastic_ansible_ansible_lint_quiet_messages = { "regex":   '\mPackage installs should not use latest\|Tasks that run when changed should likely be handlers' }

" ---------- TMUX integrantion christoomey/vim-tmux-navigator------------------------------------------------
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
