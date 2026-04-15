local severity_map = {
	[1] = "Error",
	[2] = "Warning",
	[3] = "Info",
	[4] = "Hint",
}

return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.opt.signcolumn = 'number'

			-- Ctrl + d 显示完整诊断信息
			vim.keymap.set('n', '<C-d>', function()
				local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })

				if #diagnostics == 0 then
					print("No diagnostics found for the current line.")
					return
				end

				-- 将诊断信息格式化为字符串
				local messages = {}
				for _, diag in ipairs(diagnostics) do
					local severity = severity_map[diag.severity] or "Unknown"
					table.insert(messages, string.format("%s: %s", severity, diag.message))
				end
				vim.notify(table.concat(messages, "\n\n"), vim.log.levels.INFO)
			end, { noremap = true, silent = true })

			require("lsp/python")
			require("lsp/golang")
			require("lsp/cpp")
			require("lsp/ts")
			require("lsp/lua")
			require("lsp/bash")

			-- 有对应 lsp server 时才加载
			if vim.fn.executable("pyright-langserver") then
				vim.lsp.enable('pyright', true)
			end
			if vim.fn.executable("gopls") then
				vim.lsp.enable('gopls', true)
			end
			if vim.fn.executable("clangd") then
				vim.lsp.enable('clangd', true)
			end
			if vim.fn.executable("typescript-language-server") then
				vim.lsp.enable('ts_ls', true)
			end
			if vim.fn.executable("lua-language-server") then
				vim.lsp.enable('lua_ls', true)
			end
			if vim.fn.executable("bash-language-server") then
				vim.lsp.enable('bashls', true)
			end
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require "lsp_signature".setup({
				hint_prefix = "🐾 ",
			})
		end
	},
	{
		'ray-x/guihua.lua',
		run = 'cd lua/fzy && make'
	},
	'mfussenegger/nvim-dap',
	'theHamsta/nvim-dap-virtual-text',
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup()
		end,
	}
}
