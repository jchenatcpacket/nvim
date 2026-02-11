return {
	"esmuellert/codediff.nvim",
	dependencies = { "MunifTanjim/nui.nvim" },
	cmd = "CodeDiff",
	opts = {
		keymaps = {
			conflict = {
				accept_incoming = "<leader>hct", -- Accept incoming (theirs/left) change
				accept_current = "<leader>hco", -- Accept current (ours/right) change
				accept_both = "<leader>hcb", -- Accept both changes (incoming first)
				discard = "<leader>hcx", -- Discard both, keep base
				next_conflict = "]x", -- Jump to next conflict
				prev_conflict = "[x", -- Jump to previous conflict
				diffget_incoming = "2do", -- Get hunk from incoming (left/theirs) buffer
				diffget_current = "3do", -- Get hunk from current (right/ours) buffer
			},
		},
	},
}
