return {
	"saghen/blink.cmp",
	dependencies = { "rafamadriz/friendly-snippets", "marcoSven/blink-cmp-yanky" },
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

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<ESC>"] = { "hide", "fallback" },
			["<C-z>"] = { "cancel", "fallback" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		completion = {
			menu = {
				draw = {
					treesitter = { "lsp" },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
			ghost_text = {
				enabled = false,
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "codecompanion", "yank" },
			providers = {
				yank = {
					name = "yank",
					module = "blink-yanky",
					opts = {
						minLength = 2,
						onlyCurrentFiletype = true,
						trigger_characters = { '"' },
						kind_icon = "󰅍",
					},
				},
			},
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
