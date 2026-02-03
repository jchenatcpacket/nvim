return {
	"folke/trouble.nvim",
	opts = {
		win = {
			position = "right",
			size = 0.5,
		},
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>cd",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
		{
			"<leader>cs",
			"<cmd>Trouble symbols toggle focus=false<cr>",
			desc = "Symbols (Trouble)",
		},
		{
			"<leader>cl",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>cf",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
		{
			"<leader>ci",
			"<cmd>Trouble lsp_incoming_calls<cr>",
			desc = "lsp incoming calls",
		},
		{
			"<leader>co",
			"<cmd>Trouble lsp_outgoing_calls<cr>",
			desc = "lsp outgoing calls",
		},
	},
}
