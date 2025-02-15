return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",  -- Telescope 的依赖
		"nvim-telescope/telescope-fzf-native.nvim",  -- fzf 原生支持
		build = "make",  -- 如果需要编译 fzf-native
	},
	config = function()
		-- 加载 Telescope
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		-- 基本配置
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<CR>"] = function(prompt_bufnr)
							local actions = require("telescope.actions")
							actions.file_vsplit(prompt_bufnr)
						end,
					},
					n = {
						["<CR>"] = function(prompt_bufnr)
							local actions = require("telescope.actions")
							actions.file_vsplit(prompt_bufnr)
						end,
					},
				},
				-- 默认使用 fzf 排序器
				sorting_strategy = "ascending",
				layout_config = {
					prompt_position = "top",  -- 输入框在顶部
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,  -- 启用模糊查找
					override_generic_sorter = true,  -- 覆盖默认的排序器
					override_file_sorter = true,
					case_mode = "smart_case",  -- 智能大小写匹配
				},
			},
		})

		-- 加载 fzf 扩展
		pcall(telescope.load_extension, "fzf")

		-- 键位映射
		-- <C-p>: 优先按 Git 项目搜索
		vim.keymap.set("n", "<C-p>", function()
			-- 如果当前目录是 Git 项目，则使用 git_files，否则使用 find_files
			local ok = pcall(builtin.git_files)
			if not ok then
				builtin.find_files()
			end
		end, { desc = "Telescope: Find files (Git priority)" })

		-- <C-/>: 默认行为（无关 Git）的搜索
		vim.keymap.set("n", "<C-_>", builtin.find_files, { desc = "Telescope: Find files (all)" })

		-- 其他常用键位映射
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Find buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Help tags" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope: Recent files" })
		vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Telescope: Commands" })
		vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Telescope: LSP document symbols" })
	end,
}
