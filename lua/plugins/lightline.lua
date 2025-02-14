return {
	"itchyny/lightline.vim",
	config = function()
		vim.g.lightline = {
			colorscheme = "zhengkai",
			component_function = {
				filesize = "FileSize",
				gitbranch = "FugitiveHead",
			},
			inactive = {
				left = { { "readonly" }, { "modified" }, { "filename" }, { "gitbranch" } },
				right = {},
			},
			tabline = {
				left = { { "absolutepath" } },
				right = {},
			},
			-- separator = { left = "", right = "" },
			subseparator = { left = "│", right = "│" },
			component = {
				fileformat = " %{&ff}",
				fileencoding = " %{&fenc} ",
			},
			active = {
				left = {
					{ "mode", "paste" },
					{ "readonly" },
					{ "modified" },
					{ "filetype" },
					{ "filesize" },
					{ "gitbranch" },
				},
				right = {
					{ "lineinfo" },
					{ "percent" },
					{ "fileformat", "fileencoding" },
				},
			},
		}

		function FileSize()
			local bytes = vim.fn.getfsize(vim.fn.expand("%:p"))
			return string.gsub(tostring(bytes), "(%d)(%d%d%d)$", "%1,%2")
		end
	end,
}
