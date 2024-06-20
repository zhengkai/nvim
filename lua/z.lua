local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", 
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
	    'neoclide/coc.nvim',
	    branch = 'release'
	},
	-- { 'nvim-treesitter/nvim-treesitter' },
	-- { 'nvim-treesitter/playground', after = 'nvim-treesitter' },

	-- { 'haishanh/night-owl.vim' },
	{ 'tomasiser/vim-code-dark' },
	{ 'itchyny/lightline.vim' },

	-- { 'fatih/vim-go' },

	{ 'tpope/vim-fugitive' },

	-- { 'liuchengxu/vista.vim' },

	{ 'vim-scripts/YankRing.vim' },

	-- { 'python-lsp/python-lsp-server' },

	{ 'chrisbra/csv.vim' },

	{ 'tomtom/tcomment_vim' },

	-- { 'https://git.sr.ht/~whynothugo/lsp_lines.nvim' },

	-- { 'dense-analysis/ale' },
	-- { 'mfussenegger/nvim-lint' },

	{ 'mattn/emmet-vim' },

	{ 'easymotion/vim-easymotion' },

	-- { 'junegunn/fzf', 
	-- 	build = function() 
	-- 		vim.fn['fzf#install()']()
	-- 	end 
	-- },
	{ 'junegunn/fzf.vim' },

	-- { 'eandrju/cellular-automaton.nvim' },

	--{ 'pmizio/typescript-tools.nvim',
	--	dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
	--	config = function()
	--		require("typescript-tools").setup {}
	--	end
	--},
})
