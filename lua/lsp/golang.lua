local function open_go_doc()
	local params = vim.lsp.util.make_position_params()
	params.context = { includeDeclaration = true }

	vim.lsp.buf_request(0, "textDocument/definition", params, function(err, result, ctx, config)
		if err then
			vim.notify("Error getting symbol definition: " .. err.message, vim.log.levels.ERROR)
			return
		end

		if not result or not result[1] then
			vim.notify("No definition found", vim.log.levels.WARN)
			return
		end

		local uri = result[1].uri
		local range = result[1].range

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
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	on_attach = function(client, bufnr)
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
})

-- 自动补全配置
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable,
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" },
	}, {
			{ name = "buffer" },
		}),
})
