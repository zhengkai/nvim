require("lspconfig").clangd.setup({
	on_attach = function(client, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false }) -- 同步格式化
			end,
		})
		local opts = { noremap = true, silent = true }

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Find references" })
		vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)

	end,
	capabilities = require('cmp_nvim_lsp').default_capabilities(),
})
