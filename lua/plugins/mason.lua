return {
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"gopls", -- Go 语言服务器
				"golangci-lint", -- Go 静态分析工具
				"delve", -- Go 调试器
			},
		},
	},
}
