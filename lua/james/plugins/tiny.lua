return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	config = function()
		local diag = require("tiny-inline-diagnostic")
		diag.setup({
			options = {
				multilines = {
					enabled = true,
				},
			},
		})

        diag.disable()

        vim.keymap.set("n", "<leader>dt", diag.toggle, { desc = "tiny diag show all diag" })
	end,
}
