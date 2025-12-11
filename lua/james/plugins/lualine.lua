return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"f-person/git-blame.nvim",
			event = "VeryLazy",
			opts = {
				enabled = true, -- if you want to enable the plugin
				message_template = "<author>, <date> - <summary> • <<sha>>", -- template for the blame message, check the Message template section for more options
				date_format = "%m-%d-%Y %H:%M:%S", -- template for the date, check Date format section for more options
				virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
			},
		},
	},
	config = function()
		local autosession = require("auto-session.lib")

		require("lualine").setup({
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {
						"snacks_terminal",
					},
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
						function()
							vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
							vim.g.gitblame_date_format = "%x"
							local git_blame = require("gitblame")
							if git_blame.is_blame_text_available() then
								return git_blame.get_current_blame_text()
							else
								return "Not committed yet"
							end
						end,
					},
				},
				lualine_x = {
					function()
						return "Session:" .. autosession.current_session_name(true)
					end,
				},
				lualine_y = {
					"progress",
					"location",
					{
						function()
							return "Spaces:" .. _G.indent_count
						end,
					},
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
			winbar = {
				lualine_a = {},
				lualine_b = { { "filename", path = 3 } },
				lualine_c = {
					{
						function()
							return require("lspsaga.symbol.winbar").get_bar()
						end,
					},
				},
				lualine_x = { "diagnostics" },
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = { { "filename", path = 3 } },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "buffers", mode = 4, use_mode_colors = true } },
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "tabs" },
			},
		})
	end,
}
