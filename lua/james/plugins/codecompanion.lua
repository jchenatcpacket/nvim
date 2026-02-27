return {
	"olimorris/codecompanion.nvim",
	version = "^19.0.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"MeanderingProgrammer/render-markdown.nvim",
	},
	config = function()
		require("codecompanion").setup({
			display = {
				chat = {
					window = {
						position = "right",
					},
				},
			},
			interactions = {
				chat = {
					adapter = "opencode",
				},
				inline = {
					adapter = "copilot",
					model = "claude-opus-4.6",
				},
			},
		})
	end,
}
