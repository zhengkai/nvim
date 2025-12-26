local common = require("lsp.common")

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--compile-commands-dir=build",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
	},
	filetypes = { "c", "cpp", "h", "hpp", "ixx", "cuda" },
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false }) -- 同步格式化
			end,
		})
		common.keyMap("clangd", bufnr)
	end,
	capabilities = common.capabilities,
})
