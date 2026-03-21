return {
	{
		"benomahony/oil-git.nvim",
		dependencies = { "stevearc/oil.nvim" },
	},
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		config = function()
			local oil = require("oil")
			oil.setup({
				view_options = {
					-- Show files and directories that start with "."
					show_hidden = true,
					is_always_hidden = function(name, _)
						return name == ".git" or name == ".DS_Store" -- Add other folders you always want hidden
					end,
				},
				keymaps = {
					["<C-s>"] = false,
					["gs"] = {
						callback = function()
							-- get the current directory
							local prefills = { paths = oil.get_current_dir() }

							local grug_far = require("grug-far")
							-- instance check
							if not grug_far.has_instance("explorer") then
								grug_far.open({
									instanceName = "explorer",
									prefills = prefills,
									staticTitle = "Find and Replace from Explorer",
								})
							else
								grug_far.get_instance("explorer"):open()
								-- updating the prefills without clearing the search and other fields
								grug_far.get_instance("explorer"):update_input_values(prefills, false)
							end
						end,
						desc = "oil: Search in directory",
					},
				},
			})

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
}
