-- 定义自动命令
local function skeletionAu(filetype, file, line, col)
	vim.api.nvim_create_autocmd('BufNewFile', {
		pattern = filetype,
		callback = function()
			-- 读取骨架文件内容
			vim.cmd('0r ~/.config/nvim/skeleton/' .. file)
			-- 移动光标到指定位置
			vim.api.nvim_win_set_cursor(0, { line, col })
		end,
	})
end

-- 设置不同文件类型的骨架
skeletionAu('*.sh', 'bash', 3, 0)
skeletionAu('*.php', 'php', 3, 0)
skeletionAu('*.html', 'html', 8, 0)
skeletionAu('Makefile', 'makefile', 4, 1)
skeletionAu('*.proto', 'proto', 5, 9)
