require("lspconfig").clangd.setup({
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false }) -- 同步格式化
			end,
		})
		require("lsp.common").keyMap("clangd", bufnr)
	end,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
