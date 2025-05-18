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
						text = "Filetree",
						separator = true,
						text_align = "left",
					},
				},
				buffer_close_icon = "",
				modified_icon = "",
				close_icon = "",
				show_close_icon = false,
				max_name_length = 14,
				max_prefix_length = 13,
				tab_size = 13,
				show_tab_indicators = true,
				indicator = {
					style = "underline",
				},
				enforce_regular_tabs = false,
				view = "multiwindow",
				show_buffer_close_icons = true,
				separator_style = "thin",
				always_show_bufferline = true,
				diagnostics = false,
				themable = true,
			},
		})
	end,
}
