return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	config = function()
		local diag = require("tiny-inline-diagnostic")
		diag.setup({
			transparent_bg = true,
			options = {
				multilines = {
					enabled = true,
				},
				use_icons_from_diagnostic = true,
				show_all_diags_on_cursorline = true,
			},
		})

		diag.disable()

		vim.keymap.set("n", "<leader>dt", diag.toggle, { desc = "toggle tiny diag" })
	end,
}
