local common = require("lsp.common")

vim.lsp.config('bashls', {
	on_attach = function(_, bufnr)
		common.keyMap("bashls", bufnr)
	end,
	capabilities = common.capabilities,
})
