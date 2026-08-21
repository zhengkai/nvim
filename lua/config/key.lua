-- 切换窗口
vim.keymap.set("n", "q", "<Cmd>wincmd w<CR>", { silent = true })
vim.keymap.set("n", "<Esc>q", "<Cmd>wincmd W<CR>", { silent = true })

-- 退出所有窗口
vim.keymap.set("n", "Q", "<Cmd>qa<CR>", { silent = true })
