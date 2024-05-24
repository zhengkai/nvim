return function()
	require("lazy").setup({
		{
			"neoclide/coc.nvim",
			branch = "release",
			build = function()
				vim.fn.system({
					'nvim',
					'--headless',
					'-c', 'CocInstall -sync coc-css|q', -- Automatically install coc-css
				})
			end,
			config = function()
				-- 在此配置 coc.nvim

				-- 设置全局扩展，增加 golang 和 python 扩展
				vim.g.coc_global_extensions = {
					'coc-json',  -- 提供 JSON 支持
					'coc-tsserver',  -- 提供 TypeScript/JavaScript 支持
					'coc-html',  -- 提供 HTML 支持
					'coc-css',  -- 提供 CSS 支持
					'coc-go',  -- 提供 Golang 支持
					'coc-pyright',  -- 提供 Python 支持
					-- 你还可以添加其他扩展
				}

				-- 其他 coc.nvim 配置示例
				-- 保存文件时自动格式化
				vim.cmd([[
				vim.fn['coc#util#install']('coc-css')
				autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.html,*.css,*.less CocCommand prettier.formatFile
				]])
			end,
		}
	})

	-- 为一些实用设置添加键绑定
	-- 以下是一个简单的刷新和诊断快捷键绑定示例：
	vim.api.nvim_set_keymap('n', '<leader>r', ':CocRestart<CR>', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '[d', '<Plug>(coc-diagnostic-prev)', { silent = true })
	vim.api.nvim_set_keymap('n', ']d', '<Plug>(coc-diagnostic-next)', { silent = true })
end
