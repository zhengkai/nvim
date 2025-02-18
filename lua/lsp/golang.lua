local function setup_lsp(config)
	return vim.tbl_extend('force', {
		capabilities = vim.lsp.protocol.make_client_capabilities(),
		on_init = function(client)
			if client.config.flags then
				client.config.flags.allow_incremental_sync = true
			end
		end
	}, config)
end

local function open_go_doc()
	local params = vim.lsp.util.make_position_params()
	params.context = { includeDeclaration = true }

	vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result)
		if err then
			vim.notify("Error getting symbol definition: " .. err.message, vim.log.levels.ERROR)
			return
		end

		if not result or not result[1] then
			vim.notify("No definition found", vim.log.levels.WARN)
			return
		end

		local uri = result[1].uri

		-- 提取包名和符号名
		local filepath = vim.uri_to_fname(uri)
		local package_name = vim.fn.fnamemodify(filepath, ":h:t")
		local symbol_name = vim.fn.expand("<cword>")

		-- 构建 Golang 文档 URL
		local doc_url = string.format("https://pkg.go.dev/%s#%s", package_name, symbol_name)

		-- 打开浏览器
		vim.fn.system({ "open", doc_url })
	end)
end

-- 配置 gopls
require("lspconfig").gopls.setup({
	name = 'gopls',
	cmd = { 'gopls' },
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	on_attach = function(_, bufnr)
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

		-- 查看网页定义
		vim.keymap.set("n", "<C-u>", open_go_doc, { buffer = bufnr, desc = "Open Go documentation in browser" })

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
