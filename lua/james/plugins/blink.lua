return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		{
			"mikavilpas/blink-ripgrep.nvim",
			version = "*", -- use the latest stable version
		},
	},
	version = "1.*",
	opts = {
		cmdline = {
			keymap = {
				preset = "default",
				["<ESC>"] = {
					function(cmp)
						if cmp.is_visible() then
							cmp.cancel()
						else
							vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-c>", true, true, true), "n", true)
						end
					end,
				},
				["<Tab>"] = { "select_and_accept", "fallback" },
				["<CR>"] = { "select_accept_and_enter", "fallback" },
			},
			completion = { ghost_text = { enabled = false }, menu = { auto_show = true } },
		},

		keymap = {
			preset = "default",
			["<Tab>"] = { "select_and_accept", "fallback" },
			["<CR>"] = { "select_and_accept", "fallback" },
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<ESC>"] = { "hide", "fallback" },
			["<C-z>"] = { "cancel", "fallback" },

			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		},

		completion = {
			menu = {
				border = "rounded",
				draw = {
					treesitter = { "lsp" },
					columns = {
						{ "kind_icon" },
						{ "label", "label_description", gap = 1 },
						{ "kind" },
						{ "source_name" },
					},
				},
			},
			documentation = {
				auto_show = false,
				auto_show_delay_ms = 200,
				window = { border = "rounded" },
			},
			ghost_text = {
				enabled = false,
			},
		},

		signature = {
			enabled = true,
			window = {
				show_documentation = true,
				border = "rounded",
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "ripgrep" },
			providers = {
				ripgrep = {
					module = "blink-ripgrep",
					name = "Ripgrep",
					opts = {
						prefix_min_len = 7,
					},
				},
			},
		},
	},
}
