return {
	"NickvanDyke/opencode.nvim",
	dependencies = {
		-- Recommended for `ask()` and `select()`.
		-- Required for `snacks` provider.
		---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
		{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
	},
	config = function()
		---@type opencode.Opts
		vim.g.opencode_opts = {
			provider = {
				enabled = "tmux",
				tmux = {
					-- ...
				},
			},
		}

		vim.o.autoread = true

		vim.keymap.set({ "n", "x" }, "<leader>aa", function()
			require("opencode").ask("@this ", { submit = true })
		end, { desc = "Ask opencode" })
		vim.keymap.set({ "n", "x" }, "<leader>as", function()
			require("opencode").select()
		end, { desc = "Select action" })
		vim.keymap.set({ "n", "x" }, "<leader>ac", function()
			require("opencode").toggle()
		end, { desc = "Toggle opencode" })
		vim.keymap.set({ "n", "x" }, "<leader>au", function()
			require("opencode").command("session.undo")
		end, { desc = "undo last action" })
		vim.keymap.set({ "n", "x" }, "<leader>ad", function()
			require("opencode").prompt("fix @diagnostics at @this")
		end, { desc = "fix diagnostics" })
	end,
}
