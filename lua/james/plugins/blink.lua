return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"marcoSven/blink-cmp-yanky",
		{
			"mikavilpas/blink-ripgrep.nvim",
			version = "*", -- use the latest stable version
		},
	},
	version = "1.*",
	---@module 'blink.cmp'
	---@type blink.cmp.Config
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

		appearance = {
			nerd_font_variant = "mono",
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
			default = { "lsp", "path", "snippets", "yank", "ripgrep" },
			providers = {
				yank = {
					name = "yank",
					module = "blink-yanky",
					opts = {
						minLength = 7,
						onlyCurrentFiletype = true,
						trigger_characters = { '"' },
						kind_icon = "󰅍",
					},
				},
				ripgrep = {
					module = "blink-ripgrep",
					name = "Ripgrep",
					-- see the full configuration below for all available options
					---@module "blink-ripgrep"
					---@type blink-ripgrep.Options
					opts = {
						prefix_min_len = 7,
					},
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
