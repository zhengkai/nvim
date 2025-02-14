-- 设置编码
vim.scriptencoding = "utf-8"
vim.o.encoding = "utf-8"
vim.o.fileencodings = "utf-8"

-- 终端颜色支持
vim.o.termguicolors = true

-- 界面显示
vim.o.fillchars = vim.o.fillchars .. "vert:│"
vim.o.ruler = true
vim.o.showcmd = true
vim.o.number = true
vim.o.showmatch = true
vim.o.display = "lastline"
-- vim.cmd("syntax sync fromstart")

-- 搜索
vim.o.incsearch = true
vim.o.hlsearch = true

-- Tab 相关设置
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- 禁用 BOM
vim.o.bomb = false
