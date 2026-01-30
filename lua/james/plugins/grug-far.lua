return {
	"MagicDuck/grug-far.nvim",
	config = function()
		local grugfar = require("grug-far")
		grugfar.setup({
			-- options, see Configuration section below
			-- there are no required options atm
		})

		vim.keymap.set("n", "<leader>rw", function()
			grugfar.open({
				prefills = { search = vim.fn.expand("<cword>"), paths = vim.fn.expand("%") },
			})
		end, { desc = "Replace cword in buffer" })

		vim.keymap.set("n", "<leader>rgw", function()
			grugfar.open({
				prefills = { search = vim.fn.expand("<cword>") },
			})
		end, { desc = "Replace cword in project" })

		vim.keymap.set("v", "<leader>rs", function()
			grugfar.with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })
		end, { desc = "Replace visual selection in Buffer" })

		vim.keymap.set("v", "<leader>rgs", function()
			grugfar.with_visual_selection()
		end, { desc = "replace visual selection in project" })

		vim.api.nvim_create_user_command("GrugFarClose", function()
			grugfar.get_instance(0):close()
		end, { desc = "Closing Grug Far" })
	end,
}
