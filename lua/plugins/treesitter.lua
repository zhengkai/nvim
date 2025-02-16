return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require('nvim-treesitter.configs').setup({
				modules = {},
				auto_install = {},
				ignore_install = {},
				sync_install = false,
				-- 启用语法高亮
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},

				-- 替换默认的 = 缩进
				indent = {
					enable = true,
				},
				-- 启用自动标签
				autotag = {
					enable = true,
				},

				-- 启用增量选择
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "gkn",
						scope_incremental = "gkc",
						node_decremental = "gkm",
					},
				},

				-- 启用基于 treesitter 的文本对象
				textobjects = {
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
				},

				-- 启用 treesitter 的折叠功能
				fold = {
					enable = true,
				},

				-- 启用 treesitter 的上下文
				context_commentstring = {
					enable = true,
					enable_autocmd = false,
				},

				-- 启用 treesitter 的 rainbow 括号
				rainbow = {
					enable = true,
					extended_mode = true,
					max_file_lines = nil,
				},

				-- 启用 treesitter 的 playground
				playground = {
					enable = false,
					disable = {},
					updatetime = 25, -- 更新频率 (ms)
					persist_queries = false, -- 是否持久化查询
					keybindings = {
						toggle_query_editor = 'o',
						toggle_hl_groups = 'i',
						toggle_injected_languages = 't',
						toggle_anonymous_nodes = 'a',
						toggle_language_display = 'I',
						focus_language = 'f',
						unfocus_language = 'F',
						update = 'R',
						goto_node = '<cr>',
						show_help = '?',
					},
				},

				-- 启用 treesitter 的查询
				query_linter = {
					enable = true,
					use_virtual_text = true,
					lint_events = { "BufWrite", "CursorHold" },
				},

				-- 启用 treesitter 的自动安装
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"css",
					"go",
					"html",
					"javascript",
					"json",
					"lua",
					"python",
					"rust",
					"typescript",
					"vim",
					"yaml",
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require 'treesitter-context'.setup {
				line_numbers = true,
			}
		end,
	}
}
