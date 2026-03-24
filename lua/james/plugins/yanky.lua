return {
	"gbprod/yanky.nvim",
	dependencies = {
		{ "kkharji/sqlite.lua" },
	},
	config = function()
		require("yanky").setup({
			ring = {
				storage = "sqlite",
				permanent_wrapper = require("yanky.wrappers").remove_carriage_return,
			},
			picker = {
				select = {
					action = require("yanky.picker").actions.set_register('"'),
				},
			},
		})
		vim.keymap.set({ "n", "x" }, "<leader>p", "<cmd>YankyRingHistory<cr>", { desc = "Open Yank History" })
	end,
}
