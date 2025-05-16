return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
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
				automatic_installation = true,
			})
		end,
	},
}
