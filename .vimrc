" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

set encoding=UTF-8

call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'pearofducks/ansible-vim'
Plug 'xolox/vim-session'

call plug#end()

set number
set laststatus=2
