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

				map('n', '<leader>tb', function()
					vim.g.show_git_blame = not vim.g.show_git_blame
					gs.toggle_signs(vim.g.show_git_blame) -- 显示 Git 变更标记
					gs.toggle_current_line_blame(vim.g.show_git_blame) -- 显示每行 blame
					print('git blame')
				end)
				-- { buffer = bufnr, desc = 'Git Blame Line' })

				map('n', '<S-B>', gs.toggle_current_line_blame)

				map('n', '<leader>hb', function()
					gs.blame_line({ full = true })
				end)

				-- Navigation
				map('n', ']c', function()
					if vim.wo.diff then
						vim.cmd.normal({ ']c', bang = true })
					else
						gs.nav_hunk('next')
					end
				end)
			end,
		})
	end
}
