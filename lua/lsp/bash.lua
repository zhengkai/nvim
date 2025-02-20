require('lspconfig').bashls.setup({
	on_attach = function(_, bufnr)
		require("lsp.common").keyMap("bashls", bufnr)
	end,
})
