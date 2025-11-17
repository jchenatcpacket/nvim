local fzf = require("fzf-lua")

local action_ls = {
	{
		name = "lsp ref",
		comment = "<leader>bc",
		action = function()
			print("show lsp ref")
		end,
	},
	{
		name = "lsp def",
		comment = "<leader>ab",
		action = function()
			print("show lsp def")
		end,
	},
	{
		name = "format buffer",
		comment = "<leader>fm",
		action = function()
			print("format buffer")
		end,
	},
	{
		name = "Echo cWORD",
		action = function()
			local current_WORD = vim.fn.expand("<cWORD>")
			print(current_WORD)
		end,
		-- rtxt = "<NOP>",
	},
	{
		name = "Jump Back",
		action = function()
			vim.cmd("normal! <C-o>")
		end,
		rtxt = "<C-o>",
	},
	{
		name = "Jump Forward",
		action = function()
			vim.cmd("normal! <C-i>")
		end,
		rtxt = "<C-i>",
	},
	{
		name = "Format Buffer",
		action = function()
			local conform = require("conform")
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end,
		rtxt = "<leader>fm",
	},

	{
		name = "Toggle Inline Diagnostics",
		action = "InlineDiagnostics",
		-- rtxt = "<leader>fm",
	},

	{
		name = "Toggle Inlay Hints",
		action = "InlayLspHints",
		-- rtxt = "<leader>fm",
	},

	{
		name = "Search in Buffer",
		action = function()
			local current_WORD = vim.fn.expand("<cWORD>")
			fzf.lgrep_curbuf({ query = current_WORD })
		end,
	},

	{
		name = "Search in Project",
		action = function()
			local current_WORD = vim.fn.expand("<cWORD>")
			fzf.live_grep({ query = current_WORD })
		end,
	},

	{
		name = "Goto Definition",
		action = vim.lsp.buf.definition,
		-- rtxt = "<NOP>",
	},

	{
		name = "Goto Implementation",
		action = vim.lsp.buf.implementation,
		-- rtxt = "<NOP>",
	},

	{
		name = "Show LSP Reference",
		action = function()
			local word = vim.fn.expand("<cword>")
			fzf.lsp_references({ jump1 = false })
		end,
		-- rtxt = "<NOP>",
	},
	{
		name = "Show LSP Definition",
		action = function()
			local word = vim.fn.expand("<cword>")
			fzf.lsp_definitions({ jump1 = false })
		end,
		-- rtxt = "<NOP>",
	},
	{
		name = "Show LSP Declaration",
		action = function()
			local word = vim.fn.expand("<cword>")
			fzf.lsp_declarations({ jump1 = false })
		end,
		-- rtxt = "<NOP>",
	},
	{
		name = "Show LSP Typedef",
		action = function()
			-- local word = vim.fn.expand('<cword>')
			fzf.lsp_typedefs({ jump1 = false })
		end,
		-- rtxt = "<NOP>",
	},
	{
		name = "Show LSP Implementation",
		action = function()
			local word = vim.fn.expand("<cword>")
			fzf.lsp_implementations({ jump1 = false })
		end,
		-- rtxt = "<NOP>",
	},
}

local quickaction = function()
	return Snacks.picker.pick({
		title = "Quick Action",
		finder = function()
			local items = {}
			for index, item in ipairs(action_ls) do
				table.insert(items, {
					text = item.comment,
					name = item.name,
					action = item.action,
				})
			end

			return items
		end,
		format = function(item)
			local ret = {}
			ret[#ret + 1] = { item.name, "SnacksPickerLabel" }
			ret[#ret + 1] = { item.text, "SnacksPickerComment" }
			return ret
		end,
		confirm = function(picker, item)
			picker:close()
			item.action()
		end,
	})
end

vim.api.nvim_create_user_command("QuickAction", function()
	return quickaction()
end, { nargs = 0, desc = "quick actions picker" })
