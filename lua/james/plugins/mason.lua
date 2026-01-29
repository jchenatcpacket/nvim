return {
	"williamboman/mason-lspconfig.nvim",
	config = function()
		require("mason-lspconfig").setup()

		vim.api.nvim_create_user_command("MasonInstallAll", function()
			local ls = {
				"cspell",
				"docker-compose-language-service",
				"dockerfile-language-server",
				"gh-actions-language-server",
				"gofumpt",
				"goimports-reviser",
				"gopls",
				"kulala-fmt",
				"lua-language-server",
				"prettier",
				"prettierd",
				"pyright",
				"rust-analyzer",
				"stylua",
			}
			vim.cmd("MasonInstall " .. table.concat(ls, " "))
		end, { desc = "MasonInstall all language tools" })
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
