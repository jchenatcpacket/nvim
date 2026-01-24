return {
	{
		"rebelot/kanagawa.nvim",
	},
	{
		"Mofiqul/vscode.nvim",
		priority = 1000,
		config = function()
			vim.o.background = "dark"
			vim.cmd("colorscheme vscode")
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{ "folke/tokyonight.nvim" },
}
