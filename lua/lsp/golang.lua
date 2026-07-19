local common = require("lsp.common")

local function get_doc_link()
	local params = vim.lsp.util.make_position_params(0, vim.lsp.get_clients({ bufnr = 0 })[1].offset_encoding)
	vim.lsp.buf_request(0, 'textDocument/hover', params, function(err, result)
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
			vim.fn.jobstart({ 'xdg-open', url }, { detach = true })
			return
		end
		print("doc link not found")
	end)
end

local function syncOrganizeImports()
	local client = vim.lsp.get_clients({ bufnr = 0 })[1]
	if not client then
		return
	end

	local params = vim.lsp.util.make_range_params(
		0,
		client.offset_encoding
	)

	params.context = {
		only = { "source.organizeImports" },
	}

	local response = vim.lsp.buf_request_sync(
		0,
		"textDocument/codeAction",
		params,
		1000
	)

	for _, result in pairs(response or {}) do
		for _, action in pairs(result.result or {}) do
			if action.edit then
				vim.lsp.util.apply_workspace_edit(
					action.edit,
					client.offset_encoding
				)
			elseif action.command then
				vim.lsp.commands.execute(action.command)
			end
		end
	end
end

vim.lsp.config("gopls", {
	name = 'gopls',
	cmd = { 'gopls' },
	capabilities = common.capabilities,
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				unreachable = true,
				nilness = true,
				shadow = true,
				unusedwrite = true,
				useany = true,
			},
			staticcheck = true,
		},
	},
	on_attach = function(_, bufnr)
		vim.keymap.set("n", "<C-u>", get_doc_link, { buffer = bufnr, desc = "Go to definition" })

		common.keyMap("gopls", bufnr)

		-- 保存时格式化
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ async = false })
				-- GoImports(bufnr)
				syncOrganizeImports()
			end,
		})
	end,
	filetypes = { 'go', 'gomod' },
})
