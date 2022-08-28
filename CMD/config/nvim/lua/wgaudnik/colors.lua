  -- colorscheme neon
-- vim.cmd [[
-- try
--   colorscheme onedarker
--   set background=dark
-- endtry
-- ]]

local colorscheme = "onedarker"
local background = "dark"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

pcall(vim.set, "background=" .. background)

vim.api.nvim_set_hl(0, 'TSParameter', {fg="#D19A66"} )
vim.api.nvim_set_hl(0, 'TSFunction', {fg="#DA7137", bold=true} )
vim.api.nvim_set_hl(0, 'TSString', {fg="#009D00"} )
vim.api.nvim_set_hl(0, 'TSVariable', {fg="#D19A66"} )
vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', {fg="#545862", italic=true} )
vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', {fg="#545862", italic=true} )
vim.api.nvim_set_hl(0, 'TSRepeat', {fg="#b668cd", italic=false} )
vim.api.nvim_set_hl(0, 'TSType', {fg="#317EFC", italic=false, bold=true} )

-- vim.api.nvim_set_hl(0, 'javaTSType', {fg="#b668cd", italic=false} )
vim.api.nvim_set_hl(0, 'javaTSVariable', {fg="#D19A66", italic=false} )
vim.api.nvim_set_hl(0, 'javaTSMethod', {fg="#DA7137", italic=false, bold=true} )
vim.api.nvim_set_hl(0, 'javaFold', {fg="#6DB1FF", italic=false, bold=true} )
vim.api.nvim_set_hl(0, 'javaTSTypeBuiltin', {fg="#b668cd", italic=false, bold=false} )
vim.api.nvim_set_hl(0, 'javaTSConditional', {fg="#b668cd", italic=false, bold=false} )
