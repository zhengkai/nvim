-- 启动 efm-langserver
require('lspconfig').efm.setup({
	filetypes = { "sh", "bash", "zsh" }, -- 仅对 Shell 文件启用
	init_options = {
		documentFormatting = true,
		documentRangeFormatting = true,
		hover = true,
		completion = true,
		codeAction = true,
	},
	settings = {
		rootMarkers = { ".git/" }, -- 项目根目录标记
		languages = {
			sh = {
				{
					formatCommand = "shfmt -i 2",
					formatStdin = true,
				}, -- 格式化工具
				{
					lintCommand = "shellcheck -f gcc",
					lintSource = "shellcheck",
					lintFormats = {
						"%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m",
					},
				}, -- shellcheck 配置
			},
			bash = {
				{ formatCommand = "shfmt -i 2",      formatStdin = true },
				{ lintCommand = "shellcheck -f gcc", lintSource = "shellcheck", lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" } },
			},
			zsh = {
				{ formatCommand = "shfmt -i 2",      formatStdin = true },
				{ lintCommand = "shellcheck -f gcc", lintSource = "shellcheck", lintFormats = { "%f:%l:%c: %trror: %m", "%f:%l:%c: %tarning: %m", "%f:%l:%c: %tote: %m" } },
			},
		},
	},
})
