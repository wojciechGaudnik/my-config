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
keymap("n", "<S-Left>", ":bprevious<CR>", opts)
keymap("n", "<S-Right>", ":bnext<CR>", opts)

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
