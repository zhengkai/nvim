require("lspconfig").ts_ls.setup({
	on_attach = function(_, bufnr)
		require("lsp.common").keyMap("ts_ls", bufnr)

		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})
