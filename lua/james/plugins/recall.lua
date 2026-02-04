return {
	"fnune/recall.nvim",
	version = "*",
	config = function()
		local recall = require("recall")


		recall.setup({})

		vim.keymap.set("n", "<leader>ma", recall.toggle, { desc = "toggle a mark" })
		vim.keymap.set("n", "<leader>mA", "<cmd>RecallUnmark<cr>", { desc = "unmark" })
		vim.keymap.set("n", "<leader>mt", "<cmd>RecallToggle<cr>", { desc = "toggle a mark" })
		vim.keymap.set("n", "]m", recall.goto_next, { desc = "jump to next mark" })
		vim.keymap.set("n", "[m", recall.goto_prev, { desc = "jump to previous mark" })
		vim.keymap.set("n", "<leader>mc", recall.clear, { desc = "clear all marks" })
		vim.keymap.set("n", "<leader>ml", require("recall.snacks").pick, { desc = "marklist" })
	end,
}
