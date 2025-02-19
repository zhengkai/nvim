-- 禁止任何鼠标交互
vim.o.mouse = ""

-- 光标恢复到上次打开的位置

-- 位置信息参见 :marks
--
-- 获取位置为 local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		if vim.tbl_contains({ 'help', 'quickfix' }, vim.bo[args.buf].buftype) then
			return
		end
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.cmd.normal, 'g`"')
		end
	end,
})
