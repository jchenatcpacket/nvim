return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "codecompanion" },
		},
		"zbirenbaum/copilot.lua",
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
			display = {
				action_palette = {
					provider = "fzf_lua", -- Can be "default", "telescope", "fzf_lua", "mini_pick" or "snacks". If not specified, the plugin will autodetect installed providers.
				},
			},
			strategies = {
				chat = {
					adapter = {
						name = "copilot",
						model = "claude-sonnet-4.5",
					},
				},
				inline = {
					adapter = {
						name = "copilot",
						model = "claude-sonnet-4.5",
					},
				},
				cmd = {
					adapter = {
						name = "copilot",
						model = "claude-sonnet-4.5",
					},
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
