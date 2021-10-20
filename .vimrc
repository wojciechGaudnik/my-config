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
        "Plug 'sonph/onehalf', { 'rtp': 'vim' }
       	Plug 'rakr/vim-one'
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
	Plug 'vim-scripts/AutoComplPop'	
	Plug 'ynkdir/vim-vimlparser'
	Plug 'syngan/vim-vimlint', {'depends' : 'ynkdir/vim-vimlparser'}

	"Plug 'dbakker/vim-lint'
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
set spelllang=en_us
set ttimeoutlen=1
set ttyfast
let g:mapleader=' ' 
let &t_SI = "\e[5 q"
let &t_EI = "\e[1 q"
let &t_SR = "\e[3 q"

augroup indenationPython
    au BufNewFile, BufRead *.py set tabstop=4 
    au BufNewFile, BufRead *.py set softtabstop=4
    au BufNewFile, BufRead *.py set shiftwidth=4
    au BufNewFile, BufRead *.py set textwidth=79
    au BufNewFile, BufRead *.py set expandtab
    au BufNewFile, BufRead *.py set autoindent
    au BufNewFile, BufRead *.py set fileformat=unix
augroup END

augroup indenationJsHtmlCss
  au BufNewFile, BufRead *.js, *.html, *.css set tabstop=2 |
  au BufNewFile, BufRead *.js, *.html, *.css set softtabstop=2 |
  au BufNewFile, BufRead *.js, *.html, *.css set shiftwidth=2
augroup END
" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" switching between opened files
nnoremap <C-Right> :bn<CR>
nnoremap <C-Left> :bp<CR>
" re size window
nnoremap <C-w>h :vertical resize -5<CR>
nnoremap <C-w>l :vertical resize +5<CR>
nnoremap <C-w>j :resize +5<CR>
nnoremap <C-w>k :resize -5<CR>
" prevent from putting deleted characters into buffer
noremap x "_x
noremap X "_x
noremap <Del> "_x
" <ctrl+4> close current window
"inoremap <C-\> <esc>:q<cr>               
"nnoremap <C-\> :q<cr>
inoremap <C-\> <esc>:bd<cr>               
nnoremap <C-\> :bd<cr>
" <ctrl+s> save current window
noremap <silent><C-S>          :update<CR>
vnoremap <silent><C-S>         <C-C>:update<CR>
inoremap <silent><C-S>         <C-O>:update<CR>
" toggle Spell Check
map <F5> :setlocal spell!<CR>
"========== COLORS start ==================================================
" ansible colors
function! Ansible_colors()
    	hi ansible_attributes guifg=#00afff
    	hi ansible_name guifg=#00afff
    	hi ansible_debug_keywords guifg=#00afff
    	hi ansible_extra_special_keywords guifg=#00afff
    	hi ansible_normal_keywords guifg=#00afff
    	hi ansible_loop_keywords guifg=#00afff
	hi yamlPlainScalar guifg=#00afff
	hi yamlBlockMappingKey guifg=#00afff
	hi yamlFlowString guifg=#00ff00
endfunction
function! StartUpColors()
	silent! colorscheme one
	set background=dark
	" Spelling mistakes will be colored up red.
	hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
	hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
	hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
	hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f
	hi Normal guibg=#121212 ctermbg=233 guifg=#dcdfd4 
	hi vimVar term=underline ctermfg=180 guifg=#e5c07b
	"hi link vimVar Normal 
	call Ansible_colors()
endfunction
function! TransparentUp()
	silent! colorscheme green_dark
	hi Normal guibg=NONE ctermbg=NONE
	hi Comment guifg=#808080
endfunction
" toggle transparent
function! Toggle_transparent()
    if s:is_transparent == 1
	call TransparentUp()
        let s:is_transparent = 0
    else
	call StartUpColors()
        let s:is_transparent = 1
    endif
    RainbowLoad
endfunction
nnoremap <C-x>t : call Toggle_transparent()<CR>
let s:is_transparent = 1
let g:one_allow_italics = 1
call StartUpColors()
autocmd FileType yaml.ansible call Ansible_colors() 
" ---------- Rainbow brackets frazrepo/vim-rainbow ------------------------------------------
 let g:rainbow_active = 0
autocmd FileType vim,text,yaml.ansible RainbowLoad
" ---------------------------------------------------------------------------------------------------- " Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists('*synstack')
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
"========== COLORS stop ==================================================
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
let s:is_last = 0
function! CloseTest()
	let s:is_last = 1
endfunction
"autocmd BufEnter * call CloseTest()| quit | endif
let g:NERDTreeWinPos = 'left'
let g:NERDTreeMapOpenSplit = 's'
let g:NERDTreeMapOpenVSplit = 'i'
" ---------- Devicons ryanoasis/vim-devicons --------------------------------------------------
if exists('g:loaded_webdevicons')
	call webdevicons#refresh()
endif


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
if (exists('*GitGutterGetHunkSummary'))
	function! GitStatus()
	  let [a,m,r] = GitGutterGetHunkSummary()
	  return printf('+%d ~%d -%d', a, m, r)
	endfunction
	set statusline+=%{GitStatus()}
endif

" ---------- Ansible pearofducks/ansible-vim -----------------------------------------
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = 'od'
let g:ansible_name_highlight = 'b'
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
let g:syntastic_ansible_ansible_lint_quiet_messages = { 'regex':   '\mPackage installs should not use latest\|Tasks that run when changed should likely be handlers' }
let g:syntastic_vim_vint_quiet_messages = { 'regex':   'autocmd' }
let g:syntastic_vim_checkers = ['vint']
function! ToggleSyntastic()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') ==? 'quickfix'
            lclose
            return
        endif
    endfor
    SyntasticCheck
endfunction
nnoremap <silent><C-c> :SyntasticCheck<CR>
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

" ---------- AutoComplPop mbbill/undotree ------------------------------------------------
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c


" ---------- Ripgrep / jremmen/vim-ripgrep ------------------------------------------------
nnoremap <silent><C-f> :Rg<CR> 


" ---------- UndoTree / mbbill/undotree ------------------------------------------------
nnoremap <silent><C-u> :UndotreeToggle<CR>
