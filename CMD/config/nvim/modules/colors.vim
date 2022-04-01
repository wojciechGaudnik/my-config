" -------- Trim white spaces automaticaly
function! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup DEFAULT
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" -------- Show syntax highlighting groups for word under cursor
function! <SID>SynStack()
  if !exists('*synstack')
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
nmap <C-P> :call <SID>SynStack()<CR>

"colorscheme one
set background=dark

colorscheme neon
hi keywords cterm=bold guifg=#ff5fff

echom "from colors.vim"
