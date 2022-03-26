-- This file can be loaded by calling `lua require('plugins')` from your init.vim

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  -- Essential plugins
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'

  if not vscode then
  	-- Cosmetics
	use { 'rebelot/kanagawa.nvim', config = function() require('kanagawa') end }

    	use { 'neovim/nvim-lspconfig', config = function() require('plugins.lspconfig') end } -- Collection of configurations for the built-in LSP client


    	-- Post-install/update hook with neovim command
    	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  end
end)
