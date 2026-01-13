return {
	"zeioth/garbage-day.nvim",
	dependencies = "neovim/nvim-lspconfig",
	event = "VeryLazy",
	opts = {
		excluded_lsp_clients = { "copilot" },
		grace_period = 180, -- seconds
		wakeup_delay = 700, -- ms
	},
	enabled = false,
}
