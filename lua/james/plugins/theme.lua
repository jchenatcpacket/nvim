return {
    {
		"rebelot/kanagawa.nvim",
		lazy = true,
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
		lazy = true,
	},
	{ "folke/tokyonight.nvim", lazy = true },
}
