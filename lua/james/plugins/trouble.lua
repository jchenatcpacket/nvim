return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false win.position=right<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cL",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
	},
}
