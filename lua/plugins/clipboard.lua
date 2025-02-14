return {
	-- OSC52 支持远程 SSH 复制
	{
		"ojroques/nvim-osc52",
		config = function()
			require("osc52").setup()
			-- 让 `y` 自动复制到系统剪贴板（适用于 SSH）
			-- local function copy()
			-- 	if vim.v.event.operator == "y" then
			-- 		require("osc52").copy_register("+")
			-- 	end
			-- end
			-- vim.api.nvim_create_autocmd("TextYankPost", { callback = copy })
		end,
	},

	-- yanky.nvim 增强剪贴板历史
	{
		"gbprod/yanky.nvim",
		dependencies = { "kkharji/sqlite.lua" }, -- 可选，提升历史存储能力
		config = function()
			require("yanky").setup({
				ring = { storage = "shada" },
				system_clipboard = { 
					sync_with_ring = true,
					clipboard_register = nil,
				}, 
				highlight = { timer = 250 },
			})

			local yanky = require("yanky")
			vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
			vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
			vim.keymap.set("n", "<C-j>", "<Plug>(YankyCycleForward)")
			vim.keymap.set("n", "<C-k>", "<Plug>(YankyCycleBackward)")
		end,
	}
}
