" tabs
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" searches
set ignorecase
set smartcase
set hlsearch
set incsearch
set magic


set hidden
set nowrap


set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile

set scrolloff=8

set completeopt=menuone,noinsert,noselect
set signcolumn=auto
set colorcolumn=120

set exrc
set relativenumber number

syntax on
set t_Co=256
set encoding=UTF-8
set cursorline

set laststatus=2
set splitbelow
set splitright
set lazyredraw

echom "from sets.vim"







" ---------- CONFIGURATION  -------------------------------------------------
"
"	set spelllang=en_us
"	set ttimeoutlen=1
"	set ttyfast
"	let g:mapleader=' '
"
"	" cursor different shapes
"	let &t_SI = "\e[5 q"
"	let &t_EI = "\e[1 q"
"	let &t_SR = "\e[3 q"
"
"	" menu in cmd mode
"	set wildmode=longest,list,full
"	set wildmenu
"
"	" set to auto read when a file is changed from the outside
"	set autoread
"	" au FocusGained,BufEnter * checktime
"
" 	" indenation
"	set smartindent
"	augroup indenationPython
"	  au BufNewFile, BufRead *.py set tabstop=4
"	  au BufNewFile, BufRead *.py set softtabstop=4
"	  au BufNewFile, BufRead *.py set shiftwidth=4
"	  au BufNewFile, BufRead *.py set textwidth=79
"	  au BufNewFile, BufRead *.py set expandtab
"	  au BufNewFile, BufRead *.py set autoindent
"	  au BufNewFile, BufRead *.py set fileformat=unix
"	augroup END
"	augroup indenationJsHtmlCss
"	  au BufNewFile, BufRead *.js, *.html, *.css set tabstop=2 |
"	  au BufNewFile, BufRead *.js, *.html, *.css set softtabstop=2 |
"	  au BufNewFile, BufRead *.js, *.html, *.css set shiftwidth=2
"	augroup END
"
"	" split navigation
"	nnoremap <C-J> <C-W><C-J>
"	nnoremap <C-K> <C-W><C-K>
"	nnoremap <C-L> <C-W><C-L>
"	nnoremap <C-H> <C-W><C-H>
"	" switching between opened files
"	nnoremap <C-Right> :bn<CR>
"	nnoremap <C-Left> :bp<CR>
"
"	" re size window
"	nnoremap <C-w>h :vertical resize -5<CR>
"	nnoremap <C-w>l :vertical resize +5<CR>
"	nnoremap <C-w>j :resize +5<CR>
"	nnoremap <C-w>k :resize -5<CR>
"
"	" prevent from putting deleted characters into buffer
"	noremap x "_x
"	noremap X "_x
"	noremap <Del> "_x
"
"	" close current window <ctrl+4>
"	inoremap <C-d> <esc>:q<cr>
"	nnoremap <C-d> :q<cr>
"	inoremap <C-\> <esc>:bd<cr>
"	nnoremap <C-\> :bd<cr>
"
"	" save current window <ctrl+s>
"	noremap <silent><C-S>          :update<CR>
"	vnoremap <silent><C-S>         <C-C>:update<CR>
"	inoremap <silent><C-S>         <C-O>:update<CR>
"
"	" toggle Spell Check
"	map <F5> :setlocal spell!<CR>
"
"	" clear highlighting on escape in normal mode
"	nnoremap <esc> :noh<return><esc>
"	nnoremap <esc>^[ <esc>^[
"
"	" searches
"	set ignorecase
"	set smartcase
"	set hlsearch
"	set incsearch
"	set magic
"	function! VisualSelection(direction, extra_filter) range
"		let l:saved_reg = @"
"	  execute 'normal! vgvy'
"
"	  let l:pattern = escape(@", "\\/.*'$^~[]")
"	  let l:pattern = substitute(l:pattern, '\n$', '', '')
"
"	  if a:direction ==? 'gv'
"	      call CmdLine("Ack '" . l:pattern . "' " )
"	  elseif a:direction ==? 'replace'
"	      call CmdLine('%s' . '/'. l:pattern . '/')
"	  endif
"
"	  let @/ = l:pattern
"	  let @" = l:saved_reg
"	endfunction
"	vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
"	vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>
