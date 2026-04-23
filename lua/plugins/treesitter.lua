return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			auto_install = true,
			highlight = {
				enable = true,
			},
		},
		config = function()
			-- 新版不再使用 require('nvim-treesitter.configs').setup()
			-- 高亮和缩进由 Neovim 内置 vim.treesitter 处理

			-- 自动安装语言解析器
			local ensure_installed = {
				"bash", "c", "cpp", "css", "go", "html",
				"javascript", "json", "proto", "lua",
				"python", "rust", "typescript", "vim",
				"vimdoc", "yaml", "nix", "scss",
				"gomod", "gosum", "gowork", "gotmpl", "sql", "json",
				"comment",
			}

			-- 启用基于 treesitter 的折叠
			vim.o.foldmethod = "expr"
			vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			vim.o.foldenable = false -- 默认不折叠

			-- 增量选择
			vim.keymap.set("n", "gnn", function()
				require("nvim-treesitter.incremental_selection").init_selection()
			end, { desc = "Init selection" })
			vim.keymap.set("x", "gkn", function()
				require("nvim-treesitter.incremental_selection").node_incremental()
			end, { desc = "Node incremental" })
			vim.keymap.set("x", "gkc", function()
				require("nvim-treesitter.incremental_selection").scope_incremental()
			end, { desc = "Scope incremental" })
			vim.keymap.set("x", "gkm", function()
				require("nvim-treesitter.incremental_selection").node_decremental()
			end, { desc = "Node decremental" })
		end,
	},

	-- 文本对象（需要单独插件）
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = function()
			-- 函数文本对象
			vim.keymap.set({ "x", "o" }, "af", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "if", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ac", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
			end)
			vim.keymap.set({ "x", "o" }, "ic", function()
				require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
			end)
		end,
	},

	-- 上下文显示
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				line_numbers = true,
			})
		end,
	},
}
