require('lspconfig').bashls.setup({
	on_attach = function(_, bufnr)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show documentation" })
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Find references" })
		vim.keymap.set("n", "rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
	end,
})
