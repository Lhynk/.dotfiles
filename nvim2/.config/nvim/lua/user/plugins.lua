local fn = vim.fn

-- Automatically install
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

-- Plugins
return packer.startup(function()
  use "wbthomason/packer.nvim" -- Packer can manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs
  use {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }
  use {
    "nvim-lualine/lualine.nvim",
    require = { "kyazdani42/nvim-web-devicons", opt = true }
  }
  use {"kyazdani42/nvim-tree.lua", requires = {"kyazdani42/nvim-web-devicons"}}

  -- Colorschemes
  use "arcticicestudio/nord-vim"
  use "sainnhe/gruvbox-material"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim"

  -- CMD
  use "hrsh7th/nvim-cmp" -- Engine
  use "L3MON4D3/LuaSnip" -- Snippet engine
  use "rafamadriz/friendly-snippets" -- Snippet list
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP capabilities
  use "hrsh7th/cmp-path" -- Path completions
  use "hrsh7th/cmp-buffer" -- buffer values completions

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }
  use "p00f/nvim-ts-rainbow"
  use "windwp/nvim-ts-autotag"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
