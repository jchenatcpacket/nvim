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
					add = "Sa", -- Add surrounding in Normal and Visual modes
					delete = "Sd", -- Delete surrounding
					find = "Sf", -- Find surrounding (to the right)
					find_left = "SF", -- Find surrounding (to the left)
					highlwght = "Sh", -- Highlight surrounding
					replace = "Sr", -- Replace surrounding

					suffix_last = "l", -- Suffix to search with "prev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},
			})
		end,
	},
}
