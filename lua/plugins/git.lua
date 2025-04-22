return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			require("gitsigns").setup({
				current_line_blame = false,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 6,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},
				current_line_blame_formatter = '  <author>, <author_time:%R> - <summary>',
			})
		end,
	},
	{
		"sindrets/diffview.nvim",
		lazy = false,
		config = function()
			vim.keymap.set({ "n" }, "<leader>dfo", "<cmd>DiffviewOpen<cr>", { desc = "normal mode, diffview open" })
			vim.keymap.set({ "n" }, "<leader>dfc", "<cmd>DiffviewClose<cr>", { desc = "normal mode, diffview close" })
		end,
	},
}
