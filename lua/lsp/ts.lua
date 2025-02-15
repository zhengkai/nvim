-- 配置 tsserver (TypeScript/JavaScript LSP)
require("lspconfig").ts_ls.setup({
	on_attach = function(client, bufnr)
		-- 你可以在这里添加自定义的键绑定或其他配置
		local opts = { noremap = true, silent = true, buffer = bufnr }

		-- 例如，绑定 gd 到跳转到定义
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

		-- 反查引用
		vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Find references" })

		-- 绑定 <leader>rn 到重命名
		vim.keymap.set("n", "rn", vim.lsp.buf.rename, opts)

		-- 绑定 <leader>ca 到代码操作
		vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
	end,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

require("lspconfig").eslint.setup({
	on_attach = function(client, bufnr)
		-- 你可以在这里为 eslint 添加自定义的键绑定或其他配置
		local opts = { noremap = true, silent = true, buffer = bufnr }


		-- 启用保存时自动修复
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.cmd("EslintFixAll") -- 调用 eslint 的自动修复命令
			end,
		})

		-- 例如，绑定 <leader>fmt 到格式化代码
		vim.keymap.set("n", "<leader>fmt", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
	capabilities = require("cmp_nvim_lsp").default_capabilities(), -- 启用补全功能
	settings = {
		eslint = {
			-- 自动修复问题
			autoFixOnSave = true,
			-- 启用 ESLint 对未保存文件的检查
			run = "onType",
		},
	},
})
