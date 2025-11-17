local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

local callback = function(selection)
	local fzf = require("fzf-lua")
	if selection == "grep project" then
		fzf.grep_project()
	elseif selection == "grep current buffer" then
		fzf.grep_curbuf()
	elseif selection == "find files" then
		fzf.files()
	elseif selection == "find lsp workspace symbols" then
		fzf.lsp_workspace_symbols()
	elseif selection == "find lsp document symbols" then
		fzf.lsp_document_symbols()
	else
		print("not implmented yet: " .. selection)
	end
end

local popup_options = {
	relative = "win",
	position = {
		row = "55%",
		col = "33%",
	},
	size = {
		width = 35,
		height = 20,
	},
	border = {
		style = "single",
		text = {
			top = "QuickAction",
			top_align = "center",
		},
	},
	buf_options = {
		modifiable = false,
		readonly = true,
	},
	win_options = {
		winhighlight = "Normal:Normal,FloatBorder:Normal",
	},
	focusable = true,
	enter = true,
}

local menu = Menu(popup_options, {
	lines = {
		Menu.separator("Fzf", {
			char = "-",
			text_align = "center",
		}),
		Menu.item("grep project"),
		Menu.item("grep current buffer"),
		Menu.item("find files"),
		Menu.item("find lsp workspace symbols"),
		Menu.item("find lsp document symbols"),
	},

	max_width = 30,

	keymap = {
		focus_next = { "j", "<Down>" },
		focus_prev = { "k", "<Up>" },
		close = { "<Esc>" },
		submit = { "<CR>" },
	},

	on_close = function()
		print("Quick Action Menu Closed!")
	end,

	on_submit = function(item)
		local selection = item.text
		callback(selection)
	end,
})

vim.keymap.set("n", "<leader>q", function()
	if not menu._.mounted then
		menu:mount()
	else
		menu:unmount()
	end
end, { desc = "Quick Action Menu" })

vim.api.nvim_create_user_command("QuickAction", function()
	if not menu._.mounted then
		menu:mount()
	end
end, { nargs = 0, desc = "quick actions list" })

menu:on({ event.BufLeave, event.BufWinLeave }, function()
	menu:unmount()
end)
