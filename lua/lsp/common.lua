local M = {}

local caps = require('cmp_nvim_lsp').default_capabilities()
caps.offsetEncoding = { "utf-16" }
M.capabilities = caps

function M.keyMap(name, bufnr)
	local function map(mode, key, fn, desc)
		local opts = {
			noremap = true,
			silent = true,
			buffer = bufnr,
		}
		opts.desc = name .. " " .. desc
		vim.keymap.set(mode, key, fn, opts)
	end

	map("n", "gd", vim.lsp.buf.definition, "Go to definition")
	map("n", "gr", vim.lsp.buf.references, "Find references")
	map("n", "K", vim.lsp.buf.hover, "Hover documentation")
	map("n", "rn", vim.lsp.buf.rename, "Rename")
	map("n", "ca", vim.lsp.buf.code_action, "Code action")
end

return M
