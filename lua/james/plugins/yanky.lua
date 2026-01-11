return {
	"gbprod/yanky.nvim",
	dependencies = {
		{ "folke/snacks.nvim" },
		{ "kkharji/sqlite.lua" },
	},
	keys = {
		{
			"<C-p>",
			function()
				Snacks.picker.yanky()
			end,
			mode = { "n", "i" },
			desc = "Open Yank History",
		},
	},
	config = function()
		require("yanky").setup({
			ring = {
				storage = "sqlite",
				-- When pasting text from windows system clipboard, there's always a ^M at the end of each line. Adding a permeant wrapper to remove these ^M characters when pasting will allows you to paste text from windows system clipboard without any issues.
				permanent_wrapper = require("yanky.wrappers").remove_carriage_return,
			},
		})

		vim.keymap.set({ "n", "i" }, "<C-O>", function()
			local format_title = function(item)
				local regtype_map = {
					v = "charwise",
					V = "linewise",
				}
				local regtype_text = regtype_map[item.regtype] or "blockwise"

				if item.filetype == nil then
					return regtype_text
				end

				return regtype_text .. " (" .. item.filetype .. ")"
			end

			Snacks.picker.pick({
				title = "paste",
				finder = function()
					local items = {}
					for index, value in pairs(require("yanky.history").all()) do
						value.key = index
						value.text = tostring(value.regcontents)
						items[#items + 1] = value
					end
					return items
				end,
			confirm = function(picker, item)
				picker:close()
				if item then
					local was_insert_mode = vim.api.nvim_get_mode().mode == "i"
					local lines = vim.split(item.text, "\n")
					vim.api.nvim_put(lines, "c", false, true)
					if was_insert_mode then
						vim.cmd("startinsert")
					end
				end
			end,
				format = function(item)
					return {
						{
							Snacks.picker.util.align(tostring(item.idx), #tostring(item.idx), { align = "right" }),
							"SnacksPickerIdx",
							virtual = true,
						},
						{ " ", virtual = true },
						{ item.regcontents },
					}
				end,
				preview = function(ctx)
					ctx.preview:reset()
					ctx.preview:set_lines(ctx.item.regcontents and vim.split(ctx.item.regcontents, "\n") or {})
					ctx.preview:set_title(format_title(ctx.item))
					ctx.preview:highlight({ ft = ctx.item.filetype or "text" })
				end,
			})
		end, { desc = "paste yanky before cursor" })
	end,
}
