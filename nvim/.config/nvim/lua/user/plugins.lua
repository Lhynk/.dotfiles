-- Automatically install packer if not present --
local fn = vim.fn
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end
------------------------------------------------

-- Autocammand to install/updates packages after file has been saved --
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]
-----------------------------------------------------------------------

-- Packer configuration options -- 
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}
----------------------------------

return packer.startup(function()

  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use { 'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons'} }
  use 'windwp/nvim-autopairs'
  use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use 'numToStr/Comment.nvim'
  use { 'akinsho/toggleterm.nvim', tag = 'v2.*' }
  use { 'MunifTanjim/prettier.nvim', requires = { 'neovim/nvim-lspconfig', 'jose-elias-alvarez/null-ls.nvim'}}
  use { 'akinsho/bufferline.nvim', tag = 'v2.*', requires = { 'kyazdani42/nvim-web-devicons'}}
  use {'norcalli/nvim-colorizer.lua', config = function() require('colorizer').setup() end }

  use 'junegunn/fzf.vim'
  use {'junegunn/fzf',
    run = function()
      vim.fn['fzf#install']()
    end
  }

  -- Colorschemes
  use 'sainnhe/gruvbox-material'
  use 'arcticicestudio/nord-vim'
  use 'EdenEast/nightfox.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'jose-elias-alvarez/null-ls.nvim'
  use { 'glepnir/lspsaga.nvim', branch = 'main' }

  -- CMP
  use 'hrsh7th/nvim-cmp' -- Engine
  use 'L3MON4D3/LuaSnip' -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp' -- LSP capabilities
  use 'hrsh7th/cmp-path' -- Path completions
  use 'hrsh7th/cmp-buffer' -- buffer values completions

  -- Telescope
  use {'nvim-telescope/telescope.nvim', 
    requires = {
      { 'kyazdani42/nvim-web-devicons' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    }
  }

  -- Treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'p00f/nvim-ts-rainbow'
  use 'windwp/nvim-ts-autotag'

  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
