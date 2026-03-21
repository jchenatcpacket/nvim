return {
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
	},
	{
		"Mofiqul/vscode.nvim",
		priority = 1000,
		config = function()
			vim.o.background = "dark"
			vim.cmd("colorscheme vscode")
		end,
		enabled = false,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
	{ "folke/tokyonight.nvim", enabled = false },
}
