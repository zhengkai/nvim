return {
	"github/copilot.vim",
	config = function()
		vim.g.copilot_no_tab_map = true

		-- 定义 <Esc>c 的映射
		vim.keymap.set('i', '<Esc>c', function()
			return vim.fn['copilot#Accept']("<CR>")
		end, {
			silent = true,
			expr = true,
			replace_keycodes = false,
		})
	end,
}
