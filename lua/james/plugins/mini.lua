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
					add = "`a", -- Add surrounding in Normal and Visual modes
					delete = "`d", -- Delete surrounding
					find = "`f", -- Find surrounding (to the right)
					find_left = "`F", -- Find surrounding (to the left)
					highlight = "`h", -- Highlight surrounding
					replace = "`r", -- Replace surrounding
				},
			})
		end,
	},
}
