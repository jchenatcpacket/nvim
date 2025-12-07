return {
	{
		"rachartier/tiny-code-action.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "ibhagwan/fzf-lua" },
		},
		event = "LspAttach",
		opts = { picker = "fzf-lua" },
		config = function()
			vim.keymap.set({ "n" }, "<leader>c", function()
				require("tiny-code-action").code_action()
			end, { desc = "code action" })
		end,
	},
}
