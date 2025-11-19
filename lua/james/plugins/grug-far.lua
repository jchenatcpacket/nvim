return {
	"MagicDuck/grug-far.nvim",
	config = function()
		local grugfar = require("grug-far")
		grugfar.setup({
			-- options, see Configuration section below
			-- there are no required options atm
		})

		vim.api.nvim_create_user_command("GrugFarClose", function ()
		    grugfar.get_instance(0):close()
		end, { desc = "Closing Grug Far" })
	end,
}
