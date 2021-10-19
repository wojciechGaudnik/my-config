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

        Plug 'ryanoasis/vim-devicons'
        Plug 'frazrepo/vim-rainbow'
        Plug 'sonph/onehalf', { 'rtp': 'vim' }
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
	
        Plug 'pearofducks/ansible-vim'
	Plug 'Yggdroot/indentLine'
	Plug 'aserebryakov/vim-todo-lists'
	Plug 'christoomey/vim-tmux-navigator'
	
        Plug 'preservim/nerdtree'
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'vim-syntastic/syntastic'
	Plug 'jremmen/vim-ripgrep'	
	Plug 'mbbill/undotree'
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
set smartindent
set smartcase
set nowrap
set incsearch
set colorcolumn=120
let mapleader=" " 
"set spell
" set up cursor 
set ttimeout
set ttimeoutlen=1
set ttyfast
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
let &t_SR = "\e[3 q"

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
" <ctrl+4> close current window
"inoremap <C-\> <esc>:q<cr>               
"nnoremap <C-\> :q<cr>
inoremap <C-\> <esc>:bd<cr>               
nnoremap <C-\> :bd<cr>
" <ctrl+s> save current window
noremap <silent><C-S>          :update<CR>
vnoremap <silent><C-S>         <C-C>:update<CR>
inoremap <silent><C-S>         <C-O>:update<CR>
" ripgrep
nnoremap <silent><Leader>f :Rg<CR> 
" undotree
nnoremap <silent><C-u> :UndotreeToggle<CR>
"        repo: 'https://github.com/ wojciechGaudnik / my-config.git'
" / ansible_dark.vim
" ----------------------------------------------------------------------------------------------------
" colors 
" ansible colors
function! StartUpColors()
	silent! colorscheme onehalfdark
	hi Normal guibg=#121212 ctermbg=233 
	"hi Identifier guifg=#dcdfe4
endfunction
call StartUpColors()
" transparent 
function! TransparentUp()
	silent! colorscheme green_dark
	hi Normal guibg=NONE ctermbg=NONE
	hi Comment guifg=#808080
endfunction
function! Ansible_colors()
    hi ansible_attributes guifg=#00afff
    hi ansible_name guifg=#00afff
    hi ansible_debug_keywords guifg=#00afff
    hi ansible_extra_special_keywords guifg=#00afff
    hi ansible_normal_keywords guifg=#00afff
    hi ansible_loop_keywords guifg=#00afff
endfunction
call Ansible_colors()
" togle transparent
let s:is_transparent = 1
function! Toggle_transparent()
    if s:is_transparent == 1
	call TransparentUp()
        let s:is_transparent = 0
    else
	call StartUpColors()
        let s:is_transparent = 1
    endif
    RainbowLoad
    call Ansible_colors()
endfunction
nnoremap <C-x>t : call Toggle_transparent()<CR>
" file colors
"autocmd FileType yaml.ansible colorscheme blue
" ----------------------------------------------------------------------------------------------------

" ---------- NERDTree preservim/nerdtree -------------------------------------------------
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"&buftype ==# 'quickfix' 
" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 | quit | endif
autocmd BufEnter * if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 && bufname('%') == ''| quit | endif
let g:NERDTreeWinPos = "left"
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'i'
" ---------- Devicons ryanoasis/vim-devicons --------------------------------------------------
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif

" ---------- Rainbow brackets frazrepo/vim-rainbow ------------------------------------------
autocmd BufReadPost,BufNewFile *.c,*.cpp,*.java,*.md,*.txt,.*.txt,*.py,.vimrc,*.yml RainbowLoad
"autocmd FileType vim,text,yaml.ansible RainbowLoad

" ---------- Theme oneHalfDark sonph/onehalf ------------------------------------------
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" ---------- Air-line vim-airline/vim-airline ------------------------------------------
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#keymap#enabled=0
let g:airline#extensions#netrw#enabled=0
let g:airline#extensions#term#enabled=0
let g:airline#extensions#whitespace#enabled=0
let g:airline#extensions#wordcount#enabled=0
let g:airline_powerline_fonts = 1
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

" ---------- Ripgrep jremmen/vim-ripgrep ------------------------------------------------
if executable('rg')
	let g:rg_derive_root='true'
endif

" ---------- UndoTree  mbbill/undotree ------------------------------------------------
set nobackup
set noswapfile
set nowritebackup
set undolevels=10000         		" use many levels of undo
set history=10000    			" After nocompatible
let g:undotree_SplitWidth=24
let g:undotree_RelativeTimestamp=1
let g:undotree_ShortIndicators=1
let g:persistent_undo=1
set undodir=$HOME/.vim/undodir
set undofile
