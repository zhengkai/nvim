return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("lsp/golang")
			require("lsp/cpp")
			require("lsp/ts")
			require("lsp/python")
			require("lsp/lua")
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					"gopls",
					"clangd",
					"ts_ls",
					"eslint",
					"pyright",
					"lua_ls",
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require "lsp_signature".setup({
				hint_prefix = "🐾 ",
			})
		end
	}
}
