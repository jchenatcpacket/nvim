return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			files = {
				rg_opts = [[-g "!.git"]],
			},
			grep = {
				rg_opts = [[-g "!.git"]],
				hidden = true,
			},
		})
		fzf.register_ui_select()

		vim.keymap.set({ "n" }, "<leader>sb", function()
			fzf.buffers()
		end, { desc = "search buffers" })

		vim.keymap.set({ "n" }, "<leader>sf", function()
			fzf.files()
		end, { desc = "search files" })

		vim.keymap.set({ "n" }, "<leader>st", function()
			fzf.tabs()
		end, { desc = "search tabs" })

		vim.keymap.set({ "n" }, "<leader>sl", function()
			fzf.grep({ resume = true })
		end, { desc = "search last" })

		vim.keymap.set({ "n", "v" }, "<leader>sk", function()
			fzf.keymaps({ winopts = { preview = { hidden = true } } })
		end, { desc = "search keymaps" })

		vim.keymap.set({ "n", "v" }, "<leader>sc", function()
			fzf.commands({ winopts = { preview = { hidden = true } } })
		end, { desc = "search commands" })

		vim.keymap.set("v", "<leader>sv", fzf.grep_visual, { desc = "Search visual" })
		vim.keymap.set("n", "<leader>sw", fzf.grep_cword, { desc = "Search word" })
		vim.keymap.set("n", "<leader>sW", fzf.grep_cWORD, { desc = "Search WORD" })
		vim.keymap.set({ "n" }, "<C-f>", ":FzfLua ", { desc = "fzflua command" })
	end,
}
