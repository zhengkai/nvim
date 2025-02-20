require('lspconfig').lua_ls.setup({
	filetypes = { 'lua' },
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
	on_attach = function(_, bufnr)
		require("lsp.common").keyMap("lua", bufnr)

		vim.api.nvim_create_autocmd('BufWritePre', {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
})
