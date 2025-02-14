local function update_winbar()
	if vim.api.nvim_get_current_win() == vim.fn.win_getid() then
		vim.wo.winbar = "%#WinBarActive# %F %#WinBarActiveBg#"
	else
		vim.wo.winbar = "%#WinBarBlur# %F "
	end
end

vim.api.nvim_set_hl(0, "WinBarActive", { fg = "#000000", bg = "#00afff", bold = false })
vim.api.nvim_set_hl(0, "WinBarActiveBg", { bg = "#005f87" })

vim.api.nvim_create_autocmd({"WinEnter", "BufEnter"}, {callback = update_winbar})
vim.api.nvim_create_autocmd({"WinLeave"}, {callback = function()
	vim.wo.winbar = "%#WinBarBlur# %F "
end})
