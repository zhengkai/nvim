local function trim_space()
	local pos = vim.api.nvim_win_get_cursor(0)
	vim.bo.fileformat = "unix"
	vim.cmd([[%s/\s\+$//e]])    -- 删除结尾空格
	vim.cmd([[%s/\n\{3,}/\r\r/e]]) -- 删除多余空行
	vim.cmd([[%s/\n\+\%$//e]])  -- 删除文件尾部多余换行

	local max_y = vim.api.nvim_buf_line_count(0)
	if pos[1] > max_y then
		pos[1] = max_y
	end

	local max_x = #(vim.api.nvim_buf_get_lines(0, pos[1] - 1, pos[1], false)[1] or "")
	print(max_x)
	if pos[2] > max_x then
		pos[2] = max_x
	end

	vim.api.nvim_win_set_cursor(0, pos)
end

local pattern = {
	"*.cpp",
	"*.h",
	"*.php",
	"*.sh",
	"/etc/fstab",
	"*.zsh",
	"*.json",
	"*.ts",
	"*.js",
	"*.css",
	"*.less",
	"*.sass",
	"*.scss",
	"*.txt",
	"*.html",
	"*.ini",
	"*.vim",
	"*.lua",
	".gitconfig",
	".gitconfig",
	"*.conf",
}

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern  = pattern,
	callback = function()
		vim.cmd('silent! undojoin')
		trim_space()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern  = { "*.md", "*.adoc" },
	callback = function()
		vim.bo.fileformat = "unix"
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = {
		"~/conf/filelist",
		"~/conf/apt/list-aptget",
		"~/conf/apt/list-desktop",
	},
	callback = function()
		vim.cmd("sort u")
	end,
})
