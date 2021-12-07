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
    Plug 'christoomey/vim-tmux-navigator'
call plug#end()


echom "from plugins.vim"
