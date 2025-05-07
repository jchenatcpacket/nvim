return {
	"stevearc/conform.nvim",
	dependencies = { "mason.nvim" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run multiple formatters sequentially
				python = { "isort", "black" },
				-- You can customize some of the format options for the filetype (:help conform.format)
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Conform will run the first available formatter
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
		})

		vim.keymap.set({ "n" }, "<leader>fm", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or a range of lines" })

		vim.keymap.set({ "n" }, "<leader>tw", function()
			conform.format({ formatters = { "trim_whitespace" } })
		end, { desc = "trim trailing whitespace" })
	end,
}
