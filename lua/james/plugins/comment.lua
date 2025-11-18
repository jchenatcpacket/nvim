return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
		vim.keymap.set("i", "<C-l>", function()
			require("Comment.api").toggle.linewise.current()
		end, { desc = "toggle comment insert mode" })
	end,
}
