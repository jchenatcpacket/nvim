return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"pyright",
				"gopls",
				"rust_analyzer",
				"dockerfile-language-server",
				"docker-compose-language-service",
			},
			automatic_enable = {
				"lua_ls",
				"pyright",
				"gopls",
				"rust_analyzer",
				"dockerfile-language-server",
				"docker-compose-language-service",
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
							package_uninstalled = "✗"
						}
					}
				})
			end
		},
		"neovim/nvim-lspconfig"
	}
}
