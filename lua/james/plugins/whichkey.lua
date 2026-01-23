return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.add({
			{ "<leader>l", group = "LSP" },
			{ "<leader>c", group = "Trouble" },
			{ "<leader>h", group = "Git" },
			{ "<leader>f", group = "format buffer" },
			{ "<leader>a", group = "opencode" },
			{ "<leader>j", group = "jump" },
			{ "<leader>m", group = "Recall Mark" },
			{ "<leader>t", group = "Grapple Tag" },
			{ "<leader>r", group = "Grugfar Replace" },
			{ "<leader>?", group = "keymaps and cmd" },
		})
	end,
}
