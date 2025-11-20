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
            hidden = true
		},
	},
	keys = {
		-- { "<leader>?k", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
		-- { "<leader>?c", function() Snacks.picker.commands() end, desc = "Commands" }
	},
}
