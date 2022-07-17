vim.g.qs_highlight_on_keys = {'f', 'F', 't', 'T'}
vim.g.qs_max_chars = 150
vim.highlight.create('QuickScopePrimary', {guifg='#afff5f', gui=underline, cterm=underline})
vim.highlight.create('QuickScopeSecondary', {guifg='#00C7DF', gui=underline, cterm=underline})

