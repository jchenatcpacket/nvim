return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				indent = { enable = true },
				ensure_installed = { "lua" },
				sync_install = false,
				ignore_install = { "javascript" },
				highlight = {
					enable = true,
					disable = { "c" },
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "pyright", "gopls", "rust_analyzer" },
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = { "vim" },
						},
					},
				},
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({ capabilities = capabilities })
			lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.rust_analyzer.setup({ capabilities = capabilities })

			-- lsp config
			vim.diagnostic.enable(false)
			vim.diagnostic.config({
				virtual_text = true,
				signs = false,
				underline = true,
				update_in_insert = true,
				severity_sort = true,
			})
			vim.api.nvim_create_user_command("LspDiag", function()
				vim.diagnostic.enable(not vim.diagnostic.is_enabled())
			end, { nargs = 0 })
		end,
	},
}
