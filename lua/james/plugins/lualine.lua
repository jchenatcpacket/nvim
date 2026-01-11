return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
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
				extensions = { "oil" },
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "grapple" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {
					"location",
				},
				lualine_z = {
					{
						require("opencode").statusline,
					},
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
		})
	end,
}
