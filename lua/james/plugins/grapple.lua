return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	opts = {
		scope = "git", -- also try out "git_branch"
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{ "<leader>ma", "<cmd>Grapple tag<cr>", desc = "Grapple create tag" },
		{ "<leader>mA", "<cmd>Grapple untag<cr>", desc = "Grapple untag" },
		{ "<leader>mt", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple toggle tag" },
        { "]t", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
        { "[t", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
	},
}
