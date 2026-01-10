return {
	"fnune/recall.nvim",
	version = "*",
	config = function()
		local recall = require("recall")

		recall.setup({})

		vim.keymap.set("n", "<leader>mm", recall.toggle, { noremap = true, silent = true, desc = "create a mark" })
		vim.keymap.set("n", "<leader>m]", recall.goto_next, { noremap = true, silent = true, desc = "jump to next mark" })
		vim.keymap.set("n", "<leader>m[", recall.goto_prev, { noremap = true, silent = true, desc = "jump to previous mark" })
		vim.keymap.set("n", "<leader>mc", recall.clear, { noremap = true, silent = true, desc = "clear all marks" })
        vim.keymap.set("n", "<leader>ml", require("recall.snacks").pick, { noremap = true, silent = true, desc = "marklist" })
	end,
}
