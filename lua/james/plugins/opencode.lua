return {
	"sudo-tee/opencode.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MeanderingProgrammer/render-markdown.nvim",
		-- Optional, for file mentions and commands completion, pick only one
		"saghen/blink.cmp",
		-- 'hrsh7th/nvim-cmp',

		-- Optional, for file mentions picker, pick only one
		"folke/snacks.nvim",
		-- 'nvim-telescope/telescope.nvim',
		-- 'ibhagwan/fzf-lua',
		-- 'nvim_mini/mini.nvim',
	},
	config = function()
		require("opencode").setup({
			keymap = {
				editor = {
					["<leader>ag"] = { "toggle" },
					["<leader>aI"] = { "open_input_new_session" },
					["<leader>aq"] = { "close" },
				},
			},
		})
	end,
}
