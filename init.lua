vim.o.directory = "/tmp/zhengkai"
vim.o.laststatus = 3
vim.wo.wrap = false
vim.g.loaded_perl_provider = 0
vim.opt.clipboard = "unnamedplus"

-- quickfix 窗口自动关闭
vim.api.nvim_create_autocmd("WinLeave", {
	callback = function()
		if vim.tbl_contains({ "qf" }, vim.bo.filetype) then
			vim.cmd("q")
		end
	end,
})

require("config.style")
require("config.key")
require("config.backup")
require("config.lazy")
require("config.cursor")
require("config.vert")
require("config.winbar")
require("config.format")
require("config.make")
require("config.skeleton")
require("config.filetype")
