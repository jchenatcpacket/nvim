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
					add = "<C-r>a", -- Add surrounding in Normal and Visual modes
					delete = "<C-r>d", -- Delete surrounding
					find = "<C-r>f", -- Find surrounding (to the right)
					find_left = "<C-r>F", -- Find surrounding (to the left)
					highlight = "<C-r>h", -- Highlight surrounding
					replace = "<C-r>r", -- Replace surrounding
				},
			})
		end,
	},
}
