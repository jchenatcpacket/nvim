return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		indent = { enabled = true },
		picker = {
			ignored = true,
			hidden = true,
			exclude = { ".git", ".DS_Store" },
		},
		terminal = {
			win = {
				position = "bottom",
			}
		}
	},
	keys = {
	},
}
