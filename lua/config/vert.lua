vim.api.nvim_create_augroup("vertical_help", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  group = "vertical_help",
  pattern = "help",
  callback = function()
    vim.bo.bufhidden = "unload"
    vim.cmd("wincmd L")
    vim.cmd("vertical resize 79")
  end,
})

