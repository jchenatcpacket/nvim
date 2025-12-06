return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	config = function()
		local fzf = require("fzf-lua")
		fzf.register_ui_select()

		vim.keymap.set({ "n" }, "<C-f>", ":FzfLua ", { desc = "search current buffer" })
	end,
}
