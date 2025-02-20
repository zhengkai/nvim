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
skeletionAu('*.h', 'h', 3, 0)
skeletionAu('*.sh', 'bash', 3, 0)
skeletionAu('*.php', 'php', 3, 0)
skeletionAu('*.html', 'html', 8, 0)
skeletionAu('Makefile', 'makefile', 4, 1)
skeletionAu('*.proto', 'proto', 5, 9)

-- golang
vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "*.go",
	callback = function()
		local package_name = vim.fn.expand('%:p:h:t')
		local template = {
			'package ' .. package_name,
			'',
			'import "fmt"',
			'',
			'func foo() {',
			'	fmt.Println(`test`)',
			'}',
		}
		vim.api.nvim_buf_set_lines(0, 0, 0, false, template)
		vim.api.nvim_win_set_cursor(0, { 6, 1 })
	end,
})
