return {
	"gbprod/yanky.nvim",
	dependencies = {
		{ "folke/snacks.nvim" },
		{ "kkharji/sqlite.lua" },
	},
	config = function()
		require("yanky").setup({
			ring = {
				storage = "sqlite",
				permanent_wrapper = require("yanky.wrappers").remove_carriage_return,
			},
		})

		vim.keymap.set({ "n", "i" }, "<C-p>", function()
			Snacks.picker.yanky()
		end, { desc = "yanky History picker" })
	end,
}
