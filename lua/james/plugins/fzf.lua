return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			grep = {
				-- include hidden files for grep
				hidden = true,
			},
		})
		fzf.register_ui_select()

		vim.keymap.set({ "n" }, "<C-f>", ":FzfLua ", { desc = "fzflua command" })
	end,
}
