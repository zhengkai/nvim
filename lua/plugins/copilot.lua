return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_no_tab_map = true

		-- 定义 <Esc>c 的映射
		vim.api.nvim_set_keymap('i', '<Esc>c', '', {
			silent = true,
			script = true,
			expr = true,
			callback = function()
				return vim.fn['copilot#Accept']("<CR>")
			end
		})
	end,
}
