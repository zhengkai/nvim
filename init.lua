vim.o.directory = "/tmp/zhengkai"
vim.o.laststatus = 3
vim.wo.wrap = false
vim.g.loaded_perl_provider = 0

vim.api.nvim_create_autocmd("WinLeave", {
	pattern = "quickfix",
	callback = function()
		print("hello quickfix")
		vim.cmd("cclose")
	end,
})

require("config.style")
require("config.key")
require("config.backup")
require("config.lazy")
require("config.cursor")
require("config.vert")
require("config.winbar")
require("config.format-lua")
