return {
	"ray-x/go.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"neovim/nvim-lspconfig",
	},
	cond = function()
		return vim.fn.executable("gopls")
	end,
	config = function()
		require("go").setup({
			goimports = { "gopls" },
			gofmt = "gopls",
			lsp_cfg = false,
			lsp_keymaps = false,
		})
		vim.keymap.set('n', '<Esc>e', function()
			require('go.iferr').run()
		end, { silent = true, desc = "Go generate if err" })
	end,
	event = { "CmdlineEnter" },
	ft = { "go", 'gomod' },
	build = function()
		require("go.install").update_all_sync()
	end,
}
