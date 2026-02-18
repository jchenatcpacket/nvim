return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "tabs",
			},
		})
		vim.keymap.set("n", "<leader>b", "<cmd>BufferLinePick<cr>", { desc = "jump to a tab" })
	end,
}
