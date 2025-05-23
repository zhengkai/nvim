require("lspconfig").pyright.setup({
	on_attach = function(_, bufnr)
		require("lsp.common").keyMap("pyright", bufnr)
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
