return {
	"RRethy/vim-illuminate",
	config = function()
		require("illuminate").configure({})

		vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#1c1b1b" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#1c1b1b" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#1c1b1b" })
	end,
}
