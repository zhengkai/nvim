-- 备份

vim.o.backup = true
vim.o.backupdir = vim.fn.expand("~/.tmp/vim-backup/")

local function BackupDir()
	local backupdir = vim.fn.expand("~/.tmp/vim-backup/") .. os.date("%Y%m%d")
	if vim.fn.isdirectory(backupdir) == 0 then
		-- 448 怎么来的：tonumber("700", 8) = 448
		vim.fn.mkdir(backupdir, "p", 448)
	end

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
    vim.fn.mkdir(undodir, "p", 448)
end

vim.o.undofile = true
vim.o.undodir = undodir
vim.o.undolevels = 1000
vim.o.undoreload = 10000
