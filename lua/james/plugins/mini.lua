return {
	{
		"nvim-mini/mini.pairs",
		version = "*",
		config = function()
			require("mini.pairs").setup()
		end,
	},
	{
		"nvim-mini/mini.surround",
		version = "*",
		config = function()
            vim.keymap.set('n', 'S', '<Nop>')

			require("mini.surround").setup({
				mappings = {
					add = "ra", -- Add surrounding in Normal and Visual modes
					delete = "rd", -- Delete surrounding
					find = "rf", -- Find surrounding (to the right)
					find_left = "rF", -- Find surrounding (to the left)
					highlight = "rh", -- Highlight surrounding
					replace = "rr", -- Replace surrounding
				},
			})
		end,
	},
}
