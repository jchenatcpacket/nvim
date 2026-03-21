return {
	"MagicDuck/grug-far.nvim",
	config = function()
		local grugfar = require("grug-far")
		grugfar.setup({})

		vim.keymap.set({ "n", "x" }, "<leader>rs", function()
			local search = vim.fn.getreg("/")
			-- surround with \b if "word" search (such as when pressing `*`)
			if search and vim.startswith(search, "\\<") and vim.endswith(search, "\\>") then
				search = "\\b" .. search:sub(3, -3) .. "\\b"
			end
			grugfar.open({
				prefills = {
					search = search,
				},
			})
		end, { desc = "grug-far: Search using @/ register value or visual selection" })

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

		vim.keymap.set("v", "<leader>rv", function()
			grugfar.with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })
		end, { desc = "Replace visual selection in Buffer" })

		vim.keymap.set("v", "<leader>rgv", function()
			grugfar.with_visual_selection()
		end, { desc = "replace visual selection in project" })

		vim.api.nvim_create_user_command("GrugFarClose", function()
			grugfar.get_instance(0):close()
		end, { desc = "Closing Grug Far" })
	end,
}
