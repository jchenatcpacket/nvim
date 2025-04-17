return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	opts = {},
	config = function()
		require("fzf-lua").setup()
    vim.keymap.set("n", "<C-p>", "<CMD>FzfLua files<CR>", { desc = "search filenames" })
    vim.keymap.set("n", "<C-f>b", "<CMD>FzfLua grep_curbuf<CR>", { desc = "search current buffer" })
	end,
}

