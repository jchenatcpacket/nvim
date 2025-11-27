return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local symbols = require("trouble").statusline({
			mode = "lsp_document_symbols",
			groups = {},
			title = false,
			filter = { range = true },
			format = "{kind_icon}{symbol.name:Normal}",
			-- The following line is needed to fix the background color
			-- Set it to the lualine section you want to use
			hl_group = "lualine_c_normal",
		})

		local autosession = require("auto-session.lib")

		require("lualine").setup({
			options = {
				component_separators = { left = "", right = "" },
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
				extensions = { "oil", "trouble" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {
					function()
						return "Session:" .. autosession.current_session_name(true)
					end,
				},
				lualine_y = {
					"progress",
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
							if symbols.has() then
								return symbols.get()
							else
								return ""
							end
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
		})

		vim.cmd("set showtabline=0")
	end,
}
