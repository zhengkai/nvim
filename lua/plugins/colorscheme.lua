return {
  "Mofiqul/vscode.nvim",
  lazy = false,  -- 确保启动时加载
  priority = 1000,  -- 让它最先加载
  config = function()
    require("vscode").setup({
      style = "dark"
    })
    vim.cmd.colorscheme("vscode")
  end
}
