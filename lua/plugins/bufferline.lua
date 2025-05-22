return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		highlights = require("catppuccin.groups.integrations.bufferline").get()
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
				buffer_close_icon = "",
				modified_icon = "",
				close_icon = "",
				show_close_icon = false,
				show_tab_indicators = true,
				indicator = {
					style = "underline",
				},
				show_buffer_close_icons = true,
				always_show_bufferline = true,
				diagnostics = false,
			},
		})
	end
}
