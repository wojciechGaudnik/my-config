local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- better window navigation
keymap("n", "<ESC>", ":noh<CR><ESC>", opts)
keymap("n", "<ESC>^[", "<ESC>^[", opts)

-- split navigation
keymap("n", "<C-J>", "<C-W><C-J>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)

-- resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2resize with arrows<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize -2<CR>", opts)

-- navigate buffers
keymap("n", "<M-Left>", ":bprevious<CR>", opts)
keymap("n", "<M-Right>", ":bnext<CR>", opts)

-- Visual --
-- move text up/down
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Insert --
-- commentary
keymap("", "", ":Commentary<CR>", opts)


-- Telescope
keymap("n", "<C-f>", "<cmd>lua require('telescope.builtin').find_files()<cr>", opts)

-- NvimTree
keymap("", "<C-t>", ":NvimTreeToggle<CR>", {noremap = false})
keymap("", "<C-q>", ":NvimTreeFindFile<CR>", {noremap = false})

-- Tmux navigator
vim.g.tmux_navigator_no_mappings = 1
keymap("", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
keymap("", "<C-j>", ":TmuxNavigateDown<CR>", opts)
keymap("", "<C-k>", ":TmuxNavigateUp<CR>", opts)
keymap("", "<C-l>", ":TmuxNavigateRight<CR>", opts)

-- Close buffers
-- keymap('n', '<C-\\', function () print ('test') end, opts)
-- keymap("n", "C-\\", ":bd<CR>", opts)
-- keymap("n", [[<C-4>]], ":bd<CR>", opts)
-- Run code
keymap("n", "<M-X>", ":RunCode<CR>", opts)

-- Save
keymap("", "<C-s>", ":w<CR>", opts)

-- vim.keymap.set('n', '<C-\\>', function() print('test') end)
vim.keymap.set('n', '<C-\\>', ":bd<CR>")

-- vim.keymap.set('n', [[<C-4]], function() print('test') end)
--
--
keymap("n", "<C-u>", ":UndotreeToggle<CR>", opts)
