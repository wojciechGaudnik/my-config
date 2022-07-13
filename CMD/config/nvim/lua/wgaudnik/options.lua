local options = {
-- tabs
    tabstop = 2,                            -- insert spaces for a tab
    softtabstop = 2,                        -- how many columns (=spaces) the cursor moves right when you press <Tab> 
    shiftwidth = 2,                         -- the number of spaces inserted for each indentation
    smartindent = true,                     -- make indenting smarter again
  
-- searches
    ignorecase = true,                      -- ignore case in search patterns
    smartcase = true,                       -- smart case
    hlsearch = true,                        -- highlight all matches on previous search pattern
    incsearch = true,                       -- increase search
    magic = true,

-- undo file
    swapfile = false,                       -- creates a swapfile
    backup = false,                         -- creates a backup file
    undodir = os.getenv("HOME")..".config/nvim/undofir",
    undofile = true,

-- number
    number = true,                          -- show line number 
    relativenumber = true,                  -- show show relative line number 
    
-- splits
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window


  wrap = false,                            -- display lines as one long line


  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  cursorline = true,                       -- highlight the current line
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
