return {
	"ggandor/leap.nvim",
	config = function()
		local leap = require('leap')
		-- leap.add_default_mappings()

		-- 配置 <leader>d 为全屏双字符搜索
		vim.keymap.set('n', '<leader>l', function()
			leap.leap({ target_windows = { vim.fn.win_getid() } })
		end, { noremap = true, silent = true })
	end,
}
