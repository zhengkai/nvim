-- 备份

vim.o.backup = true
vim.o.backupdir = vim.fn.expand("~/.config/nvim/backup")

local function BackupDir()
	local backupdir = vim.fn.expand("~/.tmp/vim-backup/") .. os.date("%Y%m%d")
	if vim.fn.isdirectory(backupdir) == 0 then
		vim.fn.mkdir(backupdir, "p", 0700)
	end

	print(backupdir)

	vim.o.backupdir = backupdir
	vim.o.backupext = "-" .. os.date("%H%M%S")
end

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = BackupDir,
})

-- 无限撤消

local undodir = vim.fn.expand("~/.tmp/vim-undo")
if vim.fn.isdirectory(undodir) == 0 then
    vim.fn.mkdir(undodir, "p", 0700)
end

vim.o.undofile = true
vim.o.undodir = undodir
vim.o.undolevels = 1000
vim.o.undoreload = 10000
