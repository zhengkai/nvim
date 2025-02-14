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
				WinBarText = { fg = "#000000", bg = "#00afff" }, 
			}
		})
		vim.cmd.colorscheme("vscode")
	end
}
