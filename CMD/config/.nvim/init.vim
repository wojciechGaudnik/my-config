" Install vim-plug if not found
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \| PlugInstall --sync | source $MYVIMRC
    \| endif

call plug#begin('~/.config/nvim/plugged')
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'rakr/vim-one'
    "Plug 'dracula/vim', { 'as': 'dracula' }
    "Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

source $HOME/.config/nvim/modules/plugins.vim
source $HOME/.config/nvim/modules/sets.vim
source $HOME/.config/nvim/modules/remaps.vim

"set tabstop=4 softtabstop=4
"set shiftwidth=4
"set expandtab
"set smartindent
"
"set exrc
"set relativenumber number
"
"" searches
"set ignorecase
"set smartcase
"set hlsearch
"set incsearch
"set magic
"" clear highlighting on escape in normal mode
"nnoremap <esc> :noh<return><esc>
"
"set hidden
"set nowrap
"
"
"set noswapfile
"set nobackup
"set undodir=~/.vim/undodir
"set undofile
"
"set scrolloff=8
"
"set completeopt=menuone,noinsert,noselect
"set signcolumn=auto
"set colorcolumn=120


if exists('+termguicolors') &&  $TERM == "xterm-256color"
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme one
set background=dark

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup DEFAULT
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

"syntax on
"set t_Co=256
"set cursorline
"colorscheme onehalfdark
"let g:airline_theme='onehalfdark'




"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
"if (empty($TMUX))
"  if (has("nvim"))
"    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
"  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
"  if (has("termguicolors"))
"    set termguicolors
"  endif
"endif
"
"
"set background=dark" for the dark version
" set background=light " for the light version
"colorscheme one

