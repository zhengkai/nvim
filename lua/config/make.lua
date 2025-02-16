local makeExe = "/usr/bin/make"
local localMap = {
	file = "",
	out = "",
	err = "",
}

local function findMakeDir()
	local buf_name = vim.api.nvim_buf_get_name(0)
	if buf_name == '' then
		buf_name = "."
	end

	-- 获取当前缓冲区的绝对目录路径
	local cDir = vim.fn.fnamemodify(buf_name, ':p:h')

	while true do
		-- 检查文件是否存在且可读
		if vim.fn.filereadable(cDir .. '/Makefile') == 1 then
			return cDir
		end

		local pDir = vim.fn.fnamemodify(cDir, ':h')
		if pDir == cDir then
			break
		end

		cDir = pDir
	end
	return nil
end

local function outNotify()
	local s = localMap.file
	if localMap.out ~= "" then
		s = s .. "\n" .. localMap.out
	end
	if localMap.err ~= "" then
		s = s .. "\n" .. localMap.err
	end
	vim.notify(s, vim.log.levels.INFO)
end

-- 其实最终效果觉得不够好没用，但既然写了就留下吧
local function outWin()
	local buf = vim.api.nvim_create_buf(false, true) -- 创建临时缓冲区
	local lines = vim.split(localMap.out .. "\n" .. localMap.err, "\n")
	vim.api.nvim_buf_set_lines(buf, 0, -1, true, lines) -- 将 stdout 写入缓冲区

	local width = math.min(80, vim.o.columns - 4)
	local height = math.min(20, vim.o.lines - 4)
	local opts = {
		relative = "editor",
		width = width,
		height = height,
		col = (vim.o.columns - width) / 2,
		row = (vim.o.lines - height) / 2,
		style = "minimal",
		border = "rounded",
	}

	local win = vim.api.nvim_open_win(buf, true, opts)

	-- 滚动到窗口底部
	local last_line = vim.api.nvim_buf_line_count(buf)
	vim.api.nvim_win_set_cursor(win, { last_line, 0 })

	-- 离开窗口时自动关闭
	local cmdID
	cmdID = vim.api.nvim_create_autocmd('WinLeave', {
		callback = function()
			if vim.api.nvim_win_is_valid(win) then
				vim.api.nvim_win_close(win, true)
			end
			vim.api.nvim_del_autocmd(cmdID) -- 释放本函数
		end,
		nested = true,
	})
end

local function doMake()
	local dir = findMakeDir()
	if not dir then
		print("Makefile not found")
		return
	end

	local makefile = dir .. "/Makefile"
	local cmd = { makeExe, "-f", makefile }
	print("start Make: " .. makefile)

	vim.system(cmd, {
		text = true,
		cwd = dir,
		-- stderr = true,
	}, function(re)
		localMap.file = makefile
		localMap.out = re.stdout
		localMap.err = re.stderr

		local msg = ", Alt + m to view log"
		if re.code ~= 0 then
			vim.schedule(function()
				vim.api.nvim_echo({ { "Make failed" .. msg, "ErrorMsg" } }, true, {})
			end)
		else
			print("Make success" .. msg)
		end
	end)
end

vim.keymap.set('n', '<C-M>', doMake)
vim.keymap.set('n', '<Esc>x', outWin)
vim.keymap.set('n', '<Esc>m', outNotify)
