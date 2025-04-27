return {
	{
		"numToStr/Comment.nvim",
		lazy = false,
		config = function()
			require("Comment").setup({
				---Add a space b/w comment and the line
				padding = true,
				---Whether the cursor should stay at its position
				sticky = true,
				---Lines to be ignored while (un)comment
				ignore = nil,
				---LHS of toggle mappings in NORMAL mode
				toggler = {
					---Line-comment toggle keymap
					line = "<leader>tcc",
					---Block-comment toggle keymap
					block = "<leader>tcb",
				},
				extra = {
					---Add comment on the line above
					above = "<leader>cla",
					---Add comment on the line below
					below = "<leader>clb",
					---Add comment at the end of line
					eol = "<leader>ceol",
				},
			})
		end,
	},
	{
		"folke/flash.nvim",
		lazy = false,
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
		keys = {
			{
				"<leader>s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
		},
	},
	-- tmux can do floating windows
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		lazy = false,
		config = function()
			require("toggleterm").setup({
				direction = "float",
			})
			vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "floating terminal" })
		end,
	},
}
