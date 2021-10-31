" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

function! BuildYCM(info)
  if a:info.status ==? 'installed' || a:info.force
    !./install.py --force-sudo
  endif
endfunction

set tags=./tags,tags;$HOME

call plug#begin('~/.vim/plugged')

  Plug 'ryanoasis/vim-devicons'
 	Plug 'frazrepo/vim-rainbow'
 	"Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'rakr/vim-one'
	Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  "Plug 'pearofducks/ansible-vim'
	Plug 'Yggdroot/indentLine' <---------------------------
	Plug 'aserebryakov/vim-todo-lists'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'christoomey/vim-system-copy'
	Plug 'tmux-plugins/vim-tmux'
	Plug 'ap/vim-css-color'
	Plug 'justinmk/vim-sneak'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-fugitive'
	Plug 'tpope/vim-commentary'

	Plug 'preservim/nerdtree'
	Plug 'airblade/vim-gitgutter'
	" Plug 'vim-syntastic/syntastic'
	Plug 'dense-analysis/ale'
	" Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'jremmen/vim-ripgrep'
	Plug 'mbbill/undotree'
	Plug 'vim-scripts/AutoComplPop'
	Plug 'ynkdir/vim-vimlparser'
	Plug 'syngan/vim-vimlint', {'depends' : 'ynkdir/vim-vimlparser'}
	Plug 'sheerun/vim-polyglot'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
	Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
	"Plug 'Vimjas/vim-python-pep8-indent'

	"Plug 'dbakker/vim-lint'
	"Plug 'powerman/vim-plugin-autosess'
	"Plug 'sheerun/vim-polyglot'


call plug#end()
if isdirectory($HOME.'/.vim/plugged/')
" ---------- CONFIGURATION  -------------------------------------------------
	syntax on
	set t_Co=256
	set encoding=UTF-8
	set cursorline
	set number relativenumber
	set laststatus=2
	set splitbelow
	set splitright
	set lazyredraw
	set nowrap
	set colorcolumn=120
	set spelllang=en_us
	set ttimeoutlen=1
	set ttyfast
	let g:mapleader=' '

	" cursor different shapes
	let &t_SI = "\e[5 q"
	let &t_EI = "\e[1 q"
	let &t_SR = "\e[3 q"

	" menu in cmd mode
	set wildmode=longest,list,full
	set wildmenu

	" set to auto read when a file is changed from the outside
	set autoread
	" au FocusGained,BufEnter * checktime

 	" indenation
	set smartindent
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

	" close current window <ctrl+4>
	inoremap <C-d> <esc>:q<cr>
	nnoremap <C-d> :q<cr>
	inoremap <C-\> <esc>:bd<cr>
	nnoremap <C-\> :bd<cr>

	" save current window <ctrl+s>
	noremap <silent><C-S>          :update<CR>
	vnoremap <silent><C-S>         <C-C>:update<CR>
	inoremap <silent><C-S>         <C-O>:update<CR>

	" toggle Spell Check
	map <F5> :setlocal spell!<CR>

	" clear highlighting on escape in normal mode
	nnoremap <esc> :noh<return><esc>
	nnoremap <esc>^[ <esc>^[

	" searches
	set ignorecase
	set smartcase
	set hlsearch
	set incsearch
	set magic
	function! VisualSelection(direction, extra_filter) range
		let l:saved_reg = @"
	  execute 'normal! vgvy'

	  let l:pattern = escape(@", "\\/.*'$^~[]")
	  let l:pattern = substitute(l:pattern, '\n$', '', '')

	  if a:direction ==? 'gv'
	      call CmdLine("Ack '" . l:pattern . "' " )
	  elseif a:direction ==? 'replace'
	      call CmdLine('%s' . '/'. l:pattern . '/')
	  endif

	  let @/ = l:pattern
	  let @" = l:saved_reg
	endfunction
	vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
	vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

	"========== COLORS start ==================================================
	" ansible colors
	function! Ansible_colors()
	" term=reverse cterm=underline ctermfg=203 ctermbg=16 gui=undercurl guifg=#ff5f5f guibg=#282c34 guisp=Red
		hi yamlPlainScalar guifg=#00afff cterm=bold
		hi yamlFlowString guifg=#00ff00
	  hi ansible_name guifg=#c678dd
	  hi ansible_attributes guifg=#00afff
	  hi ansible_extra_special_keywords cterm=bold guifg=#ff5fff
	  hi link ansible_normal_keywords ansible_name
	  hi link ansible_loop_keywords ansible_name
		hi link yamlFlowMapping ansible_name
		hi link yamlFlowMappingKey ansible_name
		hi link yamlBlockMappingKey ansible_name
	endfunction
	function! StartUpColors()
		silent! colorscheme one
		set background=dark
		call Ansible_colors()
		" Spelling mistakes will be colored up red.
		hi SpellBad cterm=underline ctermfg=203 guifg=#ff5f5f
		hi SpellLocal cterm=underline ctermfg=203 guifg=#ff5f5f
		hi SpellRare cterm=underline ctermfg=203 guifg=#ff5f5f
		hi SpellCap cterm=underline ctermfg=203 guifg=#ff5f5f
		" hi Normal guibg=#151515 ctermbg=233 guifg=#dcdfd4
		hi Normal guibg=#151515 ctermbg=233 guifg=#e9ce9b
		hi vimVar term=underline ctermfg=180 guifg=#e5c07b
		" python
		hi pythonFunction guifg=#ff8700
		hi link pythonInclude pythonStatement
		" tmux
		hi link tmuxMiscCmds Statement
		hi link tmuxSpecialCmds Statement
		hi tmuxWindowPaneCmds guifg=#ff8700
		hi link tmuxVariable Normal
		hi tmuxUserOptsSet guifg=#ff8700
  		"hi link vimVar Normal
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
	autocmd FileType vim,text,yaml.ansible,python RainbowLoad
	" -------- " Show syntax highlighting groups for word under cursor
	nmap <C-S-P> :call <SID>SynStack()<CR>
	function! <SID>SynStack()
	  if !exists('*synstack')
	    return
	  endif
	  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
	endfunction
	" ========== COLORS stop ==================================================
	" ---------- NERDTree preservim/nerdtree -------------------------------------------------
	nnoremap <leader>n :NERDTreeFocus<CR>
	nnoremap <C-n> :NERDTree<CR>
	nnoremap <C-t> :NERDTreeToggle<CR>
	nnoremap <C-q> :NERDTreeFind<CR>
	let g:NERDTreeWinPos = 'left'
	let g:NERDTreeMapOpenSplit = 's'
	let g:NERDTreeMapOpenVSplit = 'i'
	" Start NERDTree and put the cursor back in the other window.
	autocmd VimEnter * NERDTree | wincmd p
	" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
	autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
	" autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
	" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
	" autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 | quit | endif
	" autocmd BufEnter * if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1 && bufname('%') == ''| quit | endif
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

	"  ---------- Air-line vim-airline/vim-airline ------------------------------------------
	let g:airline#extensions#tabline#enabled=1
	let g:airline#extensions#tabline#formatter = 'unique_tail'
	let g:airline#extensions#ale#enabled=1
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
	function! GitStatus()
	  let [a,m,r] = GitGutterGetHunkSummary()
	  return printf('+%d ~%d -%d', a, m, r)
	endfunction
	set statusline+=%{GitStatus()}

	" ---------- Ansible pearofducks/ansible-vim -----------------------------------------
	au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
	let g:ansible_unindent_after_newline = 1
	let g:ansible_attribute_highlight = 'od'
	let g:ansible_name_highlight = 'b'
	let g:ansible_extra_keywords_highlight = 1
	let g:ansible_normal_keywords_highlight = 'Constant'
	let g:ansible_with_keywords_highlight = 'Constant'
	" let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby' }
	"
	" ---------- IndentLine Yggdroot/indentLine ------------------------------------------------
	au BufRead,BufNewFile */playbooks/*.yml IndentLinesEnable

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
	set completeopt=longest
	set shortmess+=c


	" ---------- Ripgrep / jremmen/vim-ripgrep ------------------------------------------------
	nnoremap <silent><C-f> :Rg<CR>


	" ---------- UndoTree / mbbill/undotree ------------------------------------------------
	nnoremap <silent><C-u> :UndotreeToggle<CR>


	" ---------- Repeat / tpope/vim-repeat ------------------------------------------------
	silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

	" ---------- Repeat / tpope/vim-commentar ------------------------------------------------
	map  :Commentary<CR>
	" autocmd FileType lua setlocal commentstring=#\ %s

	" ---------- YCM / ycm-core/YouCompleteMe ------------------------------------------------
	let g:ycm_autoclose_preview_window_after_completion=1
	let g:ycm_key_list_stop_completion= ['<CR>']
	map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

	" ---------- ALE / dense-analysis/ale ------------------------------------------------
	let g:ale_linters = {
				\'python': ['flake8', 'bandit'],
				\'ansible': ['ansible', 'ansible-lint']} "'pylint', 'flake8',
	let g:ale_fixers = {
				\'*': ['remove_trailing_lines', 'trim_whitespace'],
				\'python': ['black', 'autoflake'],
				\'ansible': ['prettier', 'yamlfix']}
	let g:ale_fix_on_save = 1
	let g:ale_completion_enabled = 0
	let g:ale_completion_autoimport = 0
	let g:ale_cursor_detail = 0
	let g:ale_echo_cursor = 1
	let g:ale_floating_preview = 0
	let g:ale_open_list = 0
	let g:ale_set_loclist = 0
	let g:ale_set_quickfix = 1
	let g:ale_hover_cursor = 1 " default=1, to show info in echo line
	let g:ale_floating_preview = 0
	let g:ale_hover_to_floating_preview = 1
	let g:ale_set_balloons = 1
	let g:ale_hover_to_preview = 1
	let g:ale_disable_lsp = 0
	" augroup ale_hover_cursor
   	" autocmd!
 	  " autocmd CursorHold * ALEHover
	" augroup END

	" ---------- Syntastic vim-syntastic/syntastic ------------------------------------------------
	" set statusline+=%#warningmsg#
	" set statusline+=%{SyntasticStatuslineFlag()}
	" set statusline+=%*
	" let g:syntastic_always_populate_loc_list = 1
	" let g:syntastic_auto_loc_list = 1
	" let g:syntastic_check_on_open = 1
	" let g:syntastic_check_on_wq = 0
	" let g:syntastic_ansible_ansible_lint_quiet_messages = { 'regex':   '\mPackage installs should not use latest\|Tasks that run when changed should likely be handlers' }
	" let g:syntastic_vim_vint_quiet_messages = { 'regex':   'autocmd' }
	" let g:syntastic_vim_checkers = ['vint']
	" function! ToggleSyntastic()
	"     for i in range(1, winnr('$'))
	"         let bnum = winbufnr(i)
	"         if getbufvar(bnum, '&buftype') ==? 'quickfix'
	"             lclose
	"             return
	"         endif
	"     endfor
	"     SyntasticCheck
	" endfunction
	" nnoremap <silent><C-c> :SyntasticCheck<CR>


	" ---------- COC vim-syntastic/syntastic ------------------------------------------------
endif
