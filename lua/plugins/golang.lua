return {
	"ray-x/go.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"neovim/nvim-lspconfig",
	},
	cond = function()
		-- return vim.fn.executable("gopls")
		return true
	end,
	config = function()
		require("go").setup({
			goimports = { "goimport" },
			gofmt = "gopls",
			lsp_cfg = true,
			lsp_keymaps = true,
		})
	end,
	event = { "CmdlineEnter" },
	ft = { "go", 'gomod' },
	build = function()
		require("go.install").update_all_sync()
	end,
}
