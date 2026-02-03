return {
	"folke/trouble.nvim",
	opts = {}, -- for default options, refer to the configuration section for custom setup.
	cmd = "Trouble",
	keys = {
		{
			"<leader>cd",
			"<cmd>Trouble diagnostics toggle win.position=right win.size=70<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false win.position=right win.size=70<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble loclist toggle win.position=right win.size=70<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>cf",
			"<cmd>Trouble qflist toggle win.position=right win.size=70<cr>",
			desc = "Quickfix List (Trouble)",
		},
	},
}
