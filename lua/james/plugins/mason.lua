return {
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
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup()
		end,
	},
	{
		"zapling/mason-lock.nvim",
		dependencies = "williamboman/mason.nvim",
		config = function()
			require("mason-lock").setup({
				lockfile_path = vim.fn.stdpath("config") .. "/mason-lock.json",
			})
		end,
	},
}
