return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MeanderingProgrammer/render-markdown.nvim",
		"zbirenbaum/copilot.lua",
		"nvim-mini/mini.diff",
		"saghen/blink.cmp",
	},
	config = function()
		require("codecompanion").setup({
			display = {
				action_palette = {
					provider = "fzf_lua",
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
	enabled = false,
}
