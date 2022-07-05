local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself

  use "rafamadriz/neon"
  use "lunarvim/colorschemes"

  -- Commentry 
  use "tpope/vim-commentary"

  -- Auto completion
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lua"

  -- Snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
--  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for

  -- Telescope
  use {"nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }
  use {"nvim-telescope/telescope-fzf-native.nvim", run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build" }
  -- use {'nvim-telescope/telescope-fzf-native.nvim', { run = 'make' } }

  -- CSS colors
  use "norcalli/nvim-colorizer.lua"
  -- use "ap/vim-css-color"

  -- Rainbow brackets
  use "p00f/nvim-ts-rainbow"

  -- Treesitter
  use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
  use "nvim-treesitter/playground"

  -- Tmux nagigator
  use "christoomey/vim-tmux-navigator"

  -- Autopairs paranheses 
  use "windwp/nvim-autopairs"

  -- Git signs
  use "lewis6991/gitsigns.nvim"

  -- NvimTree
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"

  -- Bufferline
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  -- FZF and RipGrep
  use { "ibhagwan/fzf-lua",  requires = { "kyazdani42/nvim-web-devicons" } }
  use { "junegunn/fzf", run = ":call fzf#install()" }
  -- use "jremmen/vim-ripgrep"
  use "mfussenegger/nvim-dap"

  -- Toggleterm
  use { "akinsho/toggleterm.nvim", tag = "v1.*"}
  use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }
  -- cmp plugins
  -- use {
  --   "hrsh7th/nvim-cmp",
  --   event = "InsertEnter", -- for lazyload
  --   requires = {
  --     { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
  --     { "f3fora/cmp-spell", after = "nvim-cmp" },
  --     { "hrsh7th/cmp-path", after = "nvim-cmp" },
  --     { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
  --     { "hrsh7th/cmp-calc", after = "nvim-cmp" },
  --     { "quangnguyen30192/cmp-nvim-ultisnips", after = "nvim-cmp" },
  --   },
  --   config = function()
  --     -- your config
  --   end,
  -- }


  -- use "hrsh7th/nvim-compe"
  
--  use "hrsh7th/nvim-cmp" -- The completion plugin
--  use "hrsh7th/cmp-buffer" -- buffer completions
--  use "hrsh7th/cmp-path" -- path completions
--  use "hrsh7th/cmp-cmdline" -- cmdline completions
--  use "saadparwaiz1/cmp_luasnip" -- snippet completions


 -- https://github.com/tjdevries/colorbuddy.nvim 

--  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
--  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins



--  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
--  use "numToStr/Comment.nvim" -- Easily comment stuff
--  use "kyazdani42/nvim-tree.lua"
--  use "akinsho/bufferline.nvim"
--  use "moll/vim-bbye"
--  use "nvim-lualine/lualine.nvim"
--  use "akinsho/toggleterm.nvim"
--  use "ahmedkhalf/project.nvim"
--  use "lewis6991/impatient.nvim"
--  use "lukas-reineke/indent-blankline.nvim"
--  use "goolord/alpha-nvim"
--  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
--  use "folke/which-key.nvim"

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
--  use "lunarvim/darkplus.nvim"



  -- LSP
--  use "neovim/nvim-lspconfig" -- enable LSP
--  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
--  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
--  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters


  -- Treesitter
--  use {
--    "nvim-treesitter/nvim-treesitter",
--    run = ":TSUpdate",
--  }
--  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
--  use "lewis6991/gitsigns.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
