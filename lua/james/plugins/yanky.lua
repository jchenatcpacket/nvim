return {
	"gbprod/yanky.nvim",
	dependencies = {
		{ "folke/snacks.nvim" },
		{ "kkharji/sqlite.lua" },
	},
	keys = {
		{
			"<C-p>",
			function()
				Snacks.picker.yanky()
			end,
			mode = { "n", "i" },
			desc = "Open Yank History",
		},
	},
	config = function()
		require("yanky").setup({
			ring = {
				storage = "sqlite",
				-- When pasting text from windows system clipboard, there's always a ^M at the end of each line. Adding a permeant wrapper to remove these ^M characters when pasting will allows you to paste text from windows system clipboard without any issues.
				permanent_wrapper = require("yanky.wrappers").remove_carriage_return,
			},
		})

		-- vim.keymap.set({ "n", "i" }, "<C-p>", function()
		-- 	require("yanky.picker").actions.put("p") -- put after cursor
		-- end, { desc = "yanky pick and put after cursor" })
		-- vim.keymap.set({ "n", "i" }, "<C-P>", function()
		--           require("yanky.picker").actions.put("P") -- put before cursor
		-- end, { desc = "yanky pick and put before cursor" })
		-- require("yanky.picker").actions.put("gp") -- put after cursor and leave the cursor after
		-- require("yanky.picker").actions.put("gP") -- put before cursor and leave the cursor after
		-- require("yanky.picker").actions.delete() -- delete entry from yank history
		-- require("yanky.picker").actions.set_register(regname) -- fill register with selected value
		-- require("yanky.picker").actions.put_and_set_register("p", regname) -- put and fill register with selected value
	end,
}
