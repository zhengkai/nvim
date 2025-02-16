require('lspconfig').lua_ls.setup({
	settings = {
		Lua = {
			runtime = {
				-- 指定 Lua 版本
				version = 'LuaJIT',
			},
			diagnostics = {
				-- 获取全局变量
				globals = { 'vim' },
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
	on_attach = function(client, bufnr)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show documentation" })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Find references" })
		vim.keymap.set("n", "rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
	end,
})

vim.api.nvim_create_autocmd('BufWritePre', {
	pattern = '*.lua', -- 仅对 Lua 文件生效
	callback = function()
		-- 调用 LSP 格式化
		vim.lsp.buf.format({ async = false }) -- async = false 表示同步格式化
	end,
})
