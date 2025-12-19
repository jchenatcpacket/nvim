return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")
		gitsigns.setup()

		vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "gitsigns reset hunk" })
		vim.keymap.set("n", "<leader>hs", gitsigns.stage_hunk, { desc = "gitsigns stage hunk" })
        vim.keymap.set('n', '<leader>hS', gitsigns.stage_buffer, { desc = "gitsigns stage buffer" })
		vim.keymap.set("n", "<leader>hp", gitsigns.preview_hunk_inline, { desc = "gitsigns review hunk" })
	end,
}
