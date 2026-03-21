return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"f-person/git-blame.nvim",
			event = "VeryLazy",
			opts = {
				enabled = true,
				message_template = "<author>, <date> - <summary> • <sha>",
				date_format = "%m-%d-%Y",
				display_virtual_text = 0,
			},
		},
	},
	config = function()
		local trouble = require("trouble")
		local symbols = trouble.statusline({
			mode = "lsp_document_symbols",
			groups = {},
			title = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name:Normal}",
			-- The following line is needed to fix the background color
			-- Set it to the lualine section you want to use
			hl_group = "lualine_c_normal",
		})
		local git_blame = require("gitblame")
		require("lualine").setup({
			options = {
				component_separators = { left = "│", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {
						"snacks_terminal",
						"snacks_layout_box",
						"opencode",
						"opencode_output",
					},
					"snacks_layout_box",
					"trouble",
					"neo-tree",
					"grug-far",
					"grug-far-historye",
					"grug-far-help",
				},
				extensions = { "oil" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = {
					{
						git_blame.get_current_blame_text,
						cond = git_blame.is_blame_text_available,
					},
				},
				lualine_x = {},
				lualine_y = {
					"location",
					"progress",
				},
				lualine_z = {
					{
						"lsp_status",
						icon = "", -- f013
						symbols = {
							-- Standard unicode symbols to cycle through for LSP progress:
							spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
							-- Standard unicode symbol for when LSP is done:
							done = "✓",
							-- Delimiter inserted between LSP names:
							separator = " ",
						},
						-- List of LSP names to ignore (e.g., `null-ls`):
						ignore_lsp = {},
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			-- tabline = {
			-- 	lualine_a = {
			-- 		{
			-- 			"tabs",
			-- 			mode = 2,
			-- 			use_mode_colors = true,
			-- 		},
			-- 	},
			-- 	lualine_b = {},
			-- 	lualine_c = {},
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = {},
			-- },
			winbar = {
				lualine_a = { "grapple" },
				lualine_b = {
					{ "filename", newfile_status = true, path = 3 },
				},
				lualine_c = {
					{
						symbols.get,
						cond = symbols.has,
					},
				},
				lualine_x = {
					{
						"filetype",
						colored = true, -- Displays filetype icon in color if set to true
						icon_only = false, -- Display only an icon for filetype
						icon = { align = "left" }, -- Display filetype icon on the right hand side
						-- icon =    {'X', align='right'}
						-- Icon string ^ in table is ignored in filetype component
					},
				},
				lualine_y = {},
				lualine_z = {},
			},

			inactive_winbar = {
				lualine_a = {},
				lualine_b = {
					{ "filename", newfile_status = true, path = 3 },
				},
				lualine_c = {},
				lualine_x = {
					{
						"filetype",
						colored = true, -- Displays filetype icon in color if set to true
						icon_only = false, -- Display only an icon for filetype
						icon = { align = "left" }, -- Display filetype icon on the right hand side
						-- icon =    {'X', align='right'}
						-- Icon string ^ in table is ignored in filetype component
					},
				},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
