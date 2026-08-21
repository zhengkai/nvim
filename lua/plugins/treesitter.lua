return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",

		config = function()
			local ensure_installed = {
				"bash", "c", "cpp", "css", "go", "html",
				"javascript", "json", "proto", "lua",
				"python", "rust", "typescript", "vim",
				"vimdoc", "yaml", "nix", "scss",
				"gomod", "gosum", "gowork", "gotmpl", "sql",
				"comment",
			}

			-- 安装 parser，限制并发
			require("nvim-treesitter").install(
				ensure_installed,
				{ max_jobs = 2 }
			)

			-- Tree-sitter highlighting
			vim.api.nvim_create_autocmd("FileType", {
				pattern = ensure_installed,
				callback = function(args)
					vim.treesitter.start(args.buf)
				end,
			})

			-- Tree-sitter folding
			vim.api.nvim_create_autocmd("FileType", {
				pattern = ensure_installed,
				callback = function()
					vim.wo.foldmethod = "expr"
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo.foldenable = false
				end,
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},

		config = function()
			require("nvim-treesitter-textobjects").setup {
				select = {
					lookahead = true,

					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
					},
				},
			}
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter-context",

		config = function()
			require("treesitter-context").setup({
				line_numbers = true,
			})
		end,
	},
}
