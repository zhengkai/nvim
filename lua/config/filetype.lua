local function au(pattern, cb)
	vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
		pattern = pattern,
		callback = cb,
	})
end

-- hosts
au("hosts", function()
	vim.bo.tabstop = 20

	-- 禁用自动完成
	vim.keymap.set('i', '<TAB>', '<TAB>', { noremap = true, silent = true })

	vim.o.syntax = 'enable'
	vim.bo.filetype = "hosts"
end)

-- rtorrent
au(".rtorrent.rc", function()
	vim.bo.filetype = "rtorrent"
end)

-- crontab
vim.api.nvim_create_autocmd("FileType", {
	pattern = "crontab",
	callback = function()
		vim.bo.tabstop = 10
		vim.bo.softtabstop = 10
		vim.bo.shiftwidth = 10
		vim.bo.expandtab = false
	end
})

-- nginx
au({
	"/etc/nginx/*",
	"/usr/local/nginx/conf/*",
	"*/nginx/*.conf",
	"nginx.conf",
	"nginx.tpl",
	"vhost.conf",
}, function()
	if vim.bo.filetype == "" then -- 如果文件类型未设置
		vim.bo.filetype = "nginx" -- 设置文件类型为 nginx
	end
end)

-- env
au({
	"env",
	"env.*",
	".env",
	".env.*",
}, function()
	vim.bo.filetype = "bash"
end)

-- .sql 文件默认为 MySQL 而不是 sql
au("*.sql", function()
	vim.bo.filetype = "mysql"
end)
