return {
	"lewis6991/gitsigns.nvim",
	config = function()
		-- vim.g.show_git_blame = false
		local gs = require('gitsigns')
		gs.setup({
			signcolumn = false,
			numhl = true,
			on_attach = function(bufnr)
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map('n', '<leader>gt', function()
					gs.toggle_signs() -- 行号位置显示 Git 变更标记
					gs.toggle_current_line_blame() -- 显示每行 blame
				end)

				map('n', '<leader>gb', function()
					gs.blame_line({ full = true })
				end)

				-- Navigation
				map('n', '<leader>gn', function()
					gs.nav_hunk('next')
				end)
			end,
		})
		vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = "#87ff00", bg = "#005700", bold = true })
		vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = "#ff8700", bg = "#575700", bold = true })
		vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = "#ff0000", bg = "#570000", bold = true })
	end
}
