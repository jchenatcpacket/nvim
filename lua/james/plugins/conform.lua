return {
	"stevearc/conform.nvim",
	dependencies = { "williamboman/mason.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			default_format_opts = {
				timeout_ms = 3000,
				async = false,
				quiet = false,
				lsp_format = "never",
			},

			formatters = {
				kulala = {
					command = "kulala-fmt",
					args = { "format", "$FILENAME" },
					stdin = false,
				},
			},

			format_on_save = false,

			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				rust = { "rustfmt", lsp_format = "fallback" },
				go = { "goimports-reviser", "gofumpt" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				http = { "kulala-fmt" },
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>fm", function()
			conform.format()
		end, { desc = "Format file or a range of lines" })

		vim.keymap.set({ "n", "v" }, "<leader>ft", function()
			conform.format({ formatters = { "trim_whitespace" } })
		end, { desc = "trim trailing whitespace" })
	end,
}
