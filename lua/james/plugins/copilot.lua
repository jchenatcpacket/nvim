return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	config = function()
		require("copilot").setup({
			copilot_model = "claude-sonnet-4.5",
			filetypes = {
				["yaml.docker-compose"] = true,
			},
		})
	end,
	enabled = false,
}
