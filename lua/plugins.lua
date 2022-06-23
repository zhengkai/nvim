-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use 'haishanh/night-owl.vim'

	use 'itchyny/lightline.vim'

	use 'fatih/vim-go'

	use 'vim-scripts/YankRing.vim'

	use 'rking/ag.vim'

	use 'tomtom/tcomment_vim'

	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'

	use {'neoclide/coc.nvim', branch = 'release'}

	use {
		"ellisonleao/gruvbox.nvim",
		requires = {"rktjmp/lush.nvim"}
	}

end)
