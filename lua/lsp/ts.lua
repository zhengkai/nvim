local common = require("lsp.common")

require("lspconfig").ts_ls.setup({
	on_attach = function(_, bufnr)
		common.keyMap("ts_ls", bufnr)

		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
	capabilities = common.capabilities,
})
