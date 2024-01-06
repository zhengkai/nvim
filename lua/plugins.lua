return require('packer').startup(function()

	use 'wbthomason/packer.nvim'

	use 'nvim-treesitter/nvim-treesitter'

	use 'haishanh/night-owl.vim'
	use 'tomasiser/vim-code-dark'
	use 'itchyny/lightline.vim'

	use 'fatih/vim-go'

	use 'tpope/vim-fugitive'

	-- use 'liuchengxu/vista.vim'

	use 'vim-scripts/YankRing.vim'

	-- use 'python-lsp/python-lsp-server'
	
	use 'chrisbra/csv.vim'

	use 'rking/ag.vim'

	use 'tomtom/tcomment_vim'
	
	use 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

	use 'dense-analysis/ale'

	use 'mattn/emmet-vim'

	use 'easymotion/vim-easymotion'

	use 'junegunn/fzf'
	use 'junegunn/fzf.vim'

	-- use 'eandrju/cellular-automaton.nvim'

	use {'neoclide/coc.nvim', branch = 'release'}

	use {
		"pmizio/typescript-tools.nvim",
		requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("typescript-tools").setup {}
		end,
	}

end)
