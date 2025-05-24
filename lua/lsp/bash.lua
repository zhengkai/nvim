local common = require("lsp.common")

require('lspconfig').bashls.setup({
	on_attach = function(_, bufnr)
		common.keyMap("bashls", bufnr)
	end,
	capabilities = common.capabilities,
})
