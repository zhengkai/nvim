vim.keymap.set('n', '<leader>rl', function()
	if vim.wo.number then
		vim.wo.number = false
	else
		vim.wo.number = true
	end
end, { desc = 'Toggle line numbers' })
