return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			vim.keymap.set('n', '<C-d>', function()
				-- vim.diagnostic.open_float() -- 显示当前行的诊断信息

				-- 获取当前行的诊断信息
				local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })

				if #diagnostics == 0 then
					print("No diagnostics found for the current line.")
					return
				end

				local severity_map = {
					[1] = "Error",
					[2] = "Warning",
					[3] = "Info",
					[4] = "Hint",
				}

				-- 将诊断信息格式化为字符串
				local messages = {}
				for _, diag in ipairs(diagnostics) do
					local severity = severity_map[diag.severity] or "Unknown"
					table.insert(messages, string.format("%s: %s", severity, diag.message))
				end
				-- 发送到 vim.notify
				vim.notify(table.concat(messages, "\n\n"), vim.log.levels.INFO)
			end, { noremap = true, silent = true })

			require("lsp/golang")
			require("lsp/cpp")
			require("lsp/ts")
			require("lsp/python")
			require("lsp/lua")
			require("lsp/efm")
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					"gopls",
					"clangd",
					"ts_ls",
					"eslint",
					"pyright",
					"lua_ls",
					"efm",
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require "lsp_signature".setup({
				hint_prefix = "🐾 ",
			})
		end
	}
}
