return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
		-- windows terminal/tmux doesn't recognize <C-/> keys
		vim.keymap.set("i", "<C-/>", function()
			require("Comment.api").toggle.linewise.current()
		end, { desc = "toggle comment insert mode" })

		vim.keymap.set("i", "<C-l>", function()
			require("Comment.api").toggle.linewise.current()
		end, { desc = "toggle comment insert mode" })
	end,
}
