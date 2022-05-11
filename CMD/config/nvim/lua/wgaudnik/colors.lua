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
