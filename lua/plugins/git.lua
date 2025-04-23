return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "┃a" },
					change = { text = "┃C" },
					delete = { text = "_d" },
					topdelete = { text = "‾td" },
					changedelete = { text = "~cd" },
					untracked = { text = "┆u" },
				},
				signs_staged = {
					add = { text = "┃a" },
					change = { text = "┃c" },
					delete = { text = "_" },
					topdelete = { text = "‾td" },
					changedelete = { text = "~cd" },
					untracked = { text = "┆u" },
				},
				current_line_blame = false,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 6,
					ignore_whitespace = false,
					virt_text_priority = 100,
					use_focus = true,
				},
				current_line_blame_formatter = "  <author>, <author_time:%R> - <summary>",
			})
		end,
	},
}
