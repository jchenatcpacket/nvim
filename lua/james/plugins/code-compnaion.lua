return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "codecompanion" },
		},
		{
			"echasnovski/mini.diff",
			config = function()
				local diff = require("mini.diff")
				diff.setup({
					-- Disabled by default
					source = diff.gen_source.none(),
				})
			end,
		},
	},
	config = function()
		require("codecompanion").setup({
			strategies = {
				chat = {
					adapter = "copilot",
					model = "claude-sonnet-4.5",
				},
				inline = {
					adapter = "copilot",
					model = "claude-sonnet-4.5",
				},
				cmd = {
					adapter = "copilot",
					model = "claude-sonnet-4.5",
				},
			},
			opts = {
				log_level = "DEBUG",
			},
		})
	end,
}
