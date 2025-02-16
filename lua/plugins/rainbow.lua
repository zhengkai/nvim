return {
	"hiphish/rainbow-delimiters.nvim",
	config = function()
		local rb = require 'rainbow-delimiters'
		vim.g.rainbow_delimiters = {
			strategy = {
				[''] = rb.strategy['global'],
				vim = rb.strategy['local'],
			},
			query = {
				[''] = 'rainbow-delimiters',
				lua = 'rainbow-blocks',
			},
			priority = {
				[''] = 110,
				lua = 210,
			},
			highlight = {
				'RainbowDelimiterRed',
				'RainbowDelimiterYellow',
				'RainbowDelimiterBlue',
				'RainbowDelimiterOrange',
				'RainbowDelimiterGreen',
				'RainbowDelimiterViolet',
				'RainbowDelimiterCyan',
			},
		}
	end
}
