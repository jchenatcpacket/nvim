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
			{ "<leader>d", group = "diagnostics", mode = "n" },
			{ "<leader>c", group = "Trouble", mode = "n" },
			{ "<leader>h", group = "Gitsigns", mode = "n" },
			{ "<leader>f", group = "formatting", mode = { "n", "v" } },
			{ "<leader>a", group = "opencode", mode = { "n", "v" } },
			{ "<leader>A", group = "claude code", mode = { "n", "v" } },
			{ "<leader>m", group = "Recall Mark", mode = "n" },
			{ "<leader>k", group = "Kulala", mode = { "n", "v" } },
			{ "<leader>t", group = "Grapple Tag", mode = "n" },
			{ "<leader>r", group = "Grugfar Replace", mode = { "n", "v" } },
			{ "<leader>rg", group = "Grugfar Replace in project", mode = { "n", "v" } },
			{ "<leader>s", group = "Fzf grep", mode = { "n", "v" } },
			{ "<leader>sg", group = "Fzf in project", mode = { "n", "v" } },
			{ "<leader>?", group = "help", mode = { "n", "v" } },
		})
	end,
}
