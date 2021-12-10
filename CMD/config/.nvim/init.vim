
source $HOME/.config/nvim/modules/plugins.vim
source $HOME/.config/nvim/modules/sets.vim
source $HOME/.config/nvim/modules/remaps.vim
source $HOME/.config/nvim/modules/configs.vim
source $HOME/.config/nvim/modules/colors.vim
source $HOME/.config/nvim/modules/vim_tmux_navigator.vim
source $HOME/.config/nvim/modules/treesitter.vim

function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup DEFAULT
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

