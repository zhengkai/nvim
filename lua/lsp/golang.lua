local function get_doc_link()
	local params = vim.lsp.util.make_position_params()

	vim.lsp.buf_request(0, 'textDocument/hover', params, function(err, result, ctx, config)
		if err then
			print("doc not found, error:", err)
			return
		end
		if not result or not result.contents then
			print("doc not found")
			return
		end

		local c = result.contents
		local url = ""
		if type(c) == 'table' and c.kind == 'markdown' then
			url = (c.value:match(".*%](.*)") or ""):gsub("^%(", ""):gsub("%)$", "")
		end
		if url:match("^http") then
			vim.fn.jobstart({ 'open', url }, { detach = true })
			return
		end
		print("doc link not found")
	end)
end

require("lspconfig").gopls.setup({
	name = 'gopls',
	cmd = { 'gopls' },
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	on_attach = function(_, bufnr)
		vim.keymap.set("n", "<C-u>", get_doc_link, { buffer = bufnr, desc = "Go to definition" })

		-- 跳转定义
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })

		-- rename
		vim.keymap.set("n", "rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })

		-- 跳转类型定义
		vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, { buffer = bufnr, desc = "Go to type definition" })

		-- 显示文档
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show documentation" })

		-- 反查引用
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Find references" })

		-- 保存时格式化
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})
	end,
	filetypes = { 'go', 'gomod' },
})
