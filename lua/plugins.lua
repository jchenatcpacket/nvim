return {
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
			{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			{ "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			{ "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		},
	},
	-- Todo: explore tmux as floating windows terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("toggleterm").setup({
				direction = "float",
			})
			vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "floating terminal" })
		end,
	},
}
