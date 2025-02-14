return {
	"Mofiqul/vscode.nvim",
	lazy = false,  -- 确保启动时加载
	priority = 1000,  -- 让它最先加载
	config = function()
		require("vscode").setup({
			style = "dark",
			group_overrides = {
				Normal = { bg = "#000000" },  -- 纯黑背景
				VertSplit = { fg = "#666666", bg = "#000000" }, 
				LineNr = { fg = "#556688", bg = "#000000" },
				CursorLineX = { bg = "#444444" },
			}
		})
		vim.opt.cursorline = true
		vim.opt.numberwidth = 5
		vim.cmd.colorscheme("vscode")
	end
}
