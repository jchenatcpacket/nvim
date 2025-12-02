vim.api.nvim_create_user_command("Lazygit", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })

vim.api.nvim_create_user_command("Terminal", function()
	Snacks.terminal()
end, { desc = "Snacks Terminal" })

vim.api.nvim_create_user_command("Explorer", function()
	Snacks.explorer()
end, { desc = "File Explorer" })

