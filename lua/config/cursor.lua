-- 禁止任何鼠标交互
vim.o.mouse = ""

-- 光标恢复到上次打开的位置

-- 位置信息参见 :marks
--
-- 获取位置为 local row, col = unpack(vim.api.nvim_buf_get_mark(0, '"'))

vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = "*",
    callback = function()
        vim.cmd('normal g`"')
    end
})
