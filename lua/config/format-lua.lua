-- 创建一个自动命令组
vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

-- 监听 BufWritePre 事件
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "FormatOnSave",
	pattern = "*.lua",  -- 只对 Lua 文件生效
	callback = function()
		-- 保存光标位置
		local cursor_pos = vim.api.nvim_win_get_cursor(0)
		-- 执行格式化命令（类似 g=G）
		vim.cmd("normal! gg=G")
		-- 恢复光标位置
		vim.api.nvim_win_set_cursor(0, cursor_pos)
	end,
})
