vim.api.nvim_create_user_command("Lazygit", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })

vim.api.nvim_create_user_command("Terminal", function()
	Snacks.terminal()
end, { desc = "Snacks Terminal" })

vim.api.nvim_create_user_command("Explorer", function()
	Snacks.explorer()
end, { desc = "File Explorer" })

vim.api.nvim_create_user_command("SetClipboard", function()
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
		title = "Select yanky history to system clipboard",
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
				vim.fn.setreg("+", item.text)
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
end, { desc = "Copy yanky history to system clipboard" })
