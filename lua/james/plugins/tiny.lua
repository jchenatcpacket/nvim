return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		require("tiny-inline-diagnostic").setup({
			options = {
				multilines = {
					always_show = true,
					enabled = true,
				},
			},
		})

		local diag = require("tiny-inline-diagnostic")
		vim.keymap.set("n", "<leader>td", diag.toggle, { desc = "toggle tiny diagnsotics" })
	end,
}
