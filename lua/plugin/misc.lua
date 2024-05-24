return function()
	require('lazy').setup({

		{ 'nvim-treesitter/nvim-treesitter',
			run = function()
				local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
				ts_update()
			end
		},
		{ 'nvim-treesitter/playground', after = 'nvim-treesitter' },

		{ 'haishanh/night-owl.vim' },
		{ 'tomasiser/vim-code-dark' },
		{ 'itchyny/lightline.vim' },

		{ 'fatih/vim-go' },

		{ 'tpope/vim-fugitive' },

		-- { 'liuchengxu/vista.vim' },

		{ 'vim-scripts/YankRing.vim' },

		-- { 'python-lsp/python-lsp-server' },

		{ 'chrisbra/csv.vim' },

		{ 'rking/ag.vim' },

		{ 'tomtom/tcomment_vim' },

		{ 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },

		{ 'dense-analysis/ale' },

		{ 'mattn/emmet-vim' },

		{ 'easymotion/vim-easymotion' },

		{ 'junegunn/fzf', 
			build = function() 
				vim.fn['fzf#install()']()
			end 
		},
		{ 'junegunn/fzf.vim' },

		-- { 'eandrju/cellular-automaton.nvim' },

		{ 'neoclide/coc.nvim', branch = 'release' },

		{ 'pmizio/typescript-tools.nvim',
			dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
			config = function()
				require("typescript-tools").setup {}
			end
		}
	}
)
end
