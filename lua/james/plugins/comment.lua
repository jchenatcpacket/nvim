return {
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
		-- windows terminal doesnt recongize <C-/> keys
		vim.keymap.set("i", "<C-/>", function()
			require("Comment.api").toggle.linewise.current()
		end, { desc = "toggle comment insert mode" })
	end,
}
