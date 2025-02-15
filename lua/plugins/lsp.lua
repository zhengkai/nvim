return {
	{
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
			require("lsp/golang")
			require("lsp/cpp")
			require("lsp/ts")
			require("lsp/python")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer", -- 缓冲区补全源
			"hrsh7th/cmp-path",   -- 路径补全源
			"hrsh7th/cmp-nvim-lsp", -- LSP 补全源
			"L3MON4D3/LuaSnip",   -- 代码片段支持
			"saadparwaiz1/cmp_luasnip", -- LuaSnip 补全源
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body) -- 使用 LuaSnip 展开代码片段
					end,
				},
				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item() -- 选择下一个补全项
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump() -- 展开或跳转代码片段
						else
							fallback() -- 默认行为
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item() -- 选择上一个补全项
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1) -- 跳转到上一个代码片段
						else
							fallback() -- 默认行为
						end
					end, { "i", "s" }),

					["<CR>"] = cmp.mapping.confirm({ select = true }), -- 确认选择
				},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" }, -- LSP 补全
					{ name = "luasnip" },  -- 代码片段补全
					{ name = "buffer" },   -- 缓冲区补全
					{ name = "path" },     -- 路径补全
				}),
			})
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
				ensure_installed = { 
					"gopls", 
					"clangd", 
					"ts_ls", 
					"eslint", 
					"pyright",
				},
			})
		end,
	},
}
