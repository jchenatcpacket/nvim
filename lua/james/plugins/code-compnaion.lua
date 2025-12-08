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
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			config = function()
				require("copilot").setup({
					filetypes = {
						["yaml.docker-compose"] = true,
					},
				})
			end,
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
			memory = {
				opts = {
					chat = {
						enabled = true,
					},
				},
			},
			opts = {
				log_level = "DEBUG",
			},
		})
	end,
}
