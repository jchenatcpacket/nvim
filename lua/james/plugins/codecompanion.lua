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
		"nvim-mini/mini.diff",
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
						model = "claude-opus-4.5",
					},
				},
				inline = {
					adapter = {
						name = "copilot",
						model = "claude-opus-4.5",
					},
				},
				cmd = {
					adapter = {
						name = "copilot",
						model = "claude-opus-4.5",
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
