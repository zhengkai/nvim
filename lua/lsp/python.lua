-- 设置 Mason 自动安装 LSP 服务器
-- require("mason").setup({
-- 	ui = {
-- 		icons = {
-- 			package_installed = "✓",
-- 			package_pending = "➜",
-- 			package_uninstalled = "✗",
-- 		},
-- 	},
-- })

-- 配置 Pyright LSP 服务器
require("lspconfig").pyright.setup({
	on_attach = function(client, bufnr)
		-- 你可以在这里添加自定义的按键映射或自动命令
		-- 例如，使用 `vim.keymap.set` 来设置 LSP 相关的快捷键
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Go to references" })
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover documentation" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code actions" })
	end,
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})
