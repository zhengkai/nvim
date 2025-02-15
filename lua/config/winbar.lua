local function update_winbar()
	local winid = vim.api.nvim_get_current_win()
	local config = vim.api.nvim_win_get_config(winid)
	if config.relative == "" then
		if vim.api.nvim_get_current_win() == vim.fn.win_getid() then
			vim.wo.winbar = "%#WinBarActive# %F %#WinBarActiveBg#"
		else
			vim.wo.winbar = "%#WinBarBlur# %f "
		end
	end
end

local function reset_winbar()

	local winid = vim.api.nvim_get_current_win()
	local config = vim.api.nvim_win_get_config(winid)

	-- 检查窗口是否为悬浮窗口
	if config.relative == "" then
		vim.wo.winbar = "%#WinBarBlur# %f "
	end
end

vim.api.nvim_set_hl(0, "WinBarActive", { fg = "#000000", bg = "#00afff", bold = false })
vim.api.nvim_set_hl(0, "WinBarActiveBg", { bg = "#005f87" })

vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {callback = update_winbar})
vim.api.nvim_create_autocmd({"WinLeave"}, {callback = reset_winbar})
