return {
	"ray-x/lsp_signature.nvim",
	event = "InsertEnter",
	config = function()
		require("lsp_signature").setup({
			bind = true,
			handler_opts = {
				border = "rounded",
			},
		})

		vim.keymap.set({ "n" }, "<C-k>", function()
			require("lsp_signature").toggle_float_win()
		end, { silent = true, noremap = true, desc = "toggle signature" })
	end,
}
