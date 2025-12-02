return {
	"gbprod/yanky.nvim",
	opts = {},
	dependencies = { "folke/snacks.nvim" },
	lazy = false,
	keys = {
		{
			"<C-p>",
			function()
				Snacks.picker.yanky()
			end,
			mode = { "i" },
			desc = "Open Yank History",
		},
	},
	config = function()
		require("yanky").setup({
			ring = {
				storage = "memory",
				-- When pasting text from windows system clipboard, there's always a ^M at the end of each line. Adding a permeant wrapper to remove these ^M characters when pasting will allows you to paste text from windows system clipboard without any issues.
				permanent_wrapper = require("yanky.wrappers").remove_carriage_return,
			},
			preserve_cursor_position = {
				enabled = true,
			},
			system_clipboard = {
				sync_with_ring = true,
			},
		})
	end,
}
