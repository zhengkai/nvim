return {
	"numToStr/Comment.nvim",
	opts = {
		-- 启用快捷键映射
		mappings = {
			basic = true,
			extra = false,
		},
	},
	config = function(_, opts)
		require("Comment").setup(opts)
		vim.keymap.set("n", "//", function()
			require("Comment.api").toggle.linewise()
		end, { noremap = true, silent = true })

		vim.keymap.set("v", "//", function()
			local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
			vim.api.nvim_feedkeys(esc, "nx", false) -- 退出可视模式
			require("Comment.api").toggle.linewise(vim.fn.visualmode())
		end, { noremap = true, silent = true })
	end,
	lazy = false
}
