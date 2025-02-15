return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/nvim-cmp",               -- 补全引擎
		"hrsh7th/cmp-nvim-lsp",           -- LSP 补全源
		"hrsh7th/cmp-buffer",             -- 缓冲区补全源
		"hrsh7th/cmp-path",               -- 路径补全源
		"hrsh7th/cmp-vsnip",              -- vsnip 补全源
		"hrsh7th/vim-vsnip",              -- vsnip 片段引擎
	},
	config = function()

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "gopls" },
		})

		require("lsp/golang")
	end,
}
