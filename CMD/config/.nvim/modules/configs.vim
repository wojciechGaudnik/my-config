
if exists('+termguicolors') &&  $TERM == "xterm-256color"
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

echom "from configs.vim"
