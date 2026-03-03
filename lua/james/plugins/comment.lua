return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup({})

		local comment = require("Comment.api")
		vim.keymap.set("i", "<C-l>", function()
			comment.toggle.linewise.current()
		end, { desc = "toggle comment insert mode" })

		vim.keymap.set({ "n", "v" }, "<leader>/u", function()
			comment.uncomment.linewise()
		end, { desc = "uncomment current line" })

		vim.keymap.set({ "n", "v" }, "<leader>/c", function()
			comment.comment.linewise()
		end, { desc = "comment current line" })
	end,
}
