return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"gopls",
				"rust_analyzer",
				"dockerls",
				"docker_compose_language_service",
                "cspell",
			},
		})
	end,
	dependencies = {
		{
			"williamboman/mason.nvim",
			config = function()
				require("mason").setup({
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				})
			end,
		},
		"neovim/nvim-lspconfig",
	},
}
