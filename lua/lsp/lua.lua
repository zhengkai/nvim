require('lspconfig').lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- 指定 Lua 版本
				version = 'LuaJIT',
			},
			diagnostics = {
				-- 获取全局变量
				globals = {'vim'},
			},
			workspace = {
				-- 指定工作目录
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})


vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*.lua', -- 仅对 Lua 文件生效
	callback = function()
		-- 调用 LSP 格式化
		vim.lsp.buf.format({ async = false }) -- async = false 表示同步格式化
	end,
})
