return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gs = require('gitsigns')
		gs.setup({
			on_attach = function(bufnr)
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map('n', '<leader>gt', function()
					vim.g.show_git_blame = not vim.g.show_git_blame
					gs.toggle_signs(not vim.g.show_git_blame) -- 行号位置显示 Git 变更标记
					gs.toggle_current_line_blame(vim.g.show_git_blame) -- 显示每行 blame
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
	end
}
