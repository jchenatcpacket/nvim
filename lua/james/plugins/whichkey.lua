return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			preset = "helix",
		})
		wk.add({
			{ "<leader>l", group = "LSP", mode = "n" },
			{ "<leader>lj", group = "LSP jump", mode = "n" },
			{ "<leader>c", group = "Trouble", mode = "n" },
			{ "<leader>h", group = "Gitsigns", mode = "n" },
			{ "<leader>f", group = "formatting", mode = "n" },
			{ "<leader>a", group = "opencode", mode = "n" },
			{ "<leader>m", group = "Recall Mark", mode = "n" },
			{ "<leader>R", group = "Kulala", mode = { "n", "v" } },
			{ "<leader>t", group = "Grapple Tag", mode = "n" },
			{ "<leader>r", group = "Grugfar Replace", mode = "n" },
			{ "<leader>?", group = "bindings", mode = "n" },
		})
	end,
}
