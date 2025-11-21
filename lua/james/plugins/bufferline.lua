return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
                show_tab_indicators = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
				indicator = {
					style = "underline",
				},
                numbers = "buffer_id",
                separator_style = "slant",
			},
		})

        vim.keymap.set("n", "<leader>b", "<cmd>BufferLinePick<cr>", {desc = "picking a buffer"})

	end,
}
