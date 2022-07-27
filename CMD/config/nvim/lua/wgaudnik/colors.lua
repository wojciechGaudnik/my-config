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
