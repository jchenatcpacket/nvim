return {
	"AckslD/nvim-neoclip.lua",
	dependencies = {
		{ "ibhagwan/fzf-lua" },
	},
	config = function()
		require("neoclip").setup({
			default_register = "*",
		})

		vim.api.nvim_create_user_command("Neoclip", function(opts)
			require("neoclip.fzf")(opts.args)
		end, {
			nargs = 1,
			desc = "neoclip set register content",
		})
	end,
}
