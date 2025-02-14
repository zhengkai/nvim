-- 切换窗口
vim.api.nvim_set_keymap("n", "q", ":wincmd w<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Esc>q", ":wincmd W<CR>", { noremap = true, silent = true })

-- 退出所有窗口
vim.api.nvim_set_keymap("n", "Q", ":qa<CR>", { noremap = true, silent = true })
