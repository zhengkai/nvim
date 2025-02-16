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
require("config.format")
require("config.make")

function UupdateAndQuit()
	-- 获取 lazy.nvim 的 API
	local lazy = require("lazy")
	print('start')

	-- 执行 Lazy update
	lazy.update({ wait = true }, function(success)
		if success then
			print('Update completed successfully')
		else
			print('Update failed')
		end
		-- 当 update 完成后，退出 Neovim
		print('end')
		vim.cmd("qa")
	end)
end
