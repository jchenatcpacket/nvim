vim.keymap.set("i", "<C-s>", "<cmd>w<cr><Esc>", { desc = "insert mode, save file" })
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "normal mode, save file" })
vim.keymap.set("i", "<D-s>", "<cmd>w<cr><Esc>", { desc = "insert mode, save file" })
vim.keymap.set("n", "<D-s>", "<cmd>w<cr>", { desc = "normal mode, save file" })

vim.keymap.set("i", "<Tab>", function()
	return string.rep(" ", vim.opt.softtabstop:get())
end, { expr = true, noremap = true })

vim.keymap.set({ "n", "v" }, "D", '"_d', { noremap = true, desc = "capital D to delete to blackhole" })

local fzf = require("fzf-lua")
local grugfar = require("grug-far")
local gitsigns = require("gitsigns")

local function get_visual_selection()
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")

	local lines = vim.api.nvim_buf_get_text(0, start_pos[2] - 1, start_pos[3] - 1, end_pos[2] - 1, end_pos[3], {})

	return table.concat(lines, "\n")
end

vim.keymap.set({"n", "v"}, "<leader>?k", function()
	fzf.keymaps({ winopts = { preview = { hidden = true } } })
end, { desc = "seach Keymaps" })

vim.keymap.set({"n", "v"}, "<leader>?c", function()
	fzf.commands({ winopts = { preview = { hidden = true } } })
end, { desc = "seach Commands" })

vim.keymap.set("n", "<leader>fw", function()
	local current_WORD = vim.fn.expand("<cWORD>")
	fzf.lgrep_curbuf({ query = current_WORD })
end, { noremap = true, desc = "search cWORD in buffer" })

vim.keymap.set("n", "<leader>fgw", function()
	local current_WORD = vim.fn.expand("<cWORD>")
	fzf.live_grep({ query = current_WORD })
end, { noremap = true, desc = "search cWORD in project" })

vim.keymap.set("n", "<leader>rw", function()
	grugfar.open({
		prefills = { search = vim.fn.expand("<cword>"), paths = vim.fn.expand("%") },
	})
end, { noremap = true, desc = "Replace cword in buffer" })

vim.keymap.set("n", "<leader>rgw", function()
	grugfar.open({
		prefills = { search = vim.fn.expand("<cword>") },
	})
end, { noremap = true, desc = "Replace cword in project" })

vim.keymap.set("n", "<leader>jd", vim.lsp.buf.definition, { noremap = true, desc = "Jump to LSP Definition" })

vim.keymap.set("n", "<leader>ji", vim.lsp.buf.implementation, { noremap = true, desc = "Jump to LSP Implementation" })

vim.keymap.set("n", "<leader>lr", function()
	fzf.lsp_references({ jump1 = false })
end, { noremap = true, desc = "Show LSP Reference" })

vim.keymap.set("n", "<leader>ld", function()
	fzf.lsp_definitions({ jump1 = false })
end, { noremap = true, desc = "Show LSP Definition" })

vim.keymap.set("n", "<leader>lc", function()
	fzf.lsp_declarations({ jump1 = false })
end, { noremap = true, desc = "Show LSP Declaration" })

vim.keymap.set("n", "<leader>lt", function()
	fzf.lsp_typedefs({ jump1 = false })
end, { noremap = true, desc = "Show LSP Typedef" })

vim.keymap.set("n", "<leader>li", function()
	fzf.lsp_implementations({ jump1 = false })
end, { noremap = true, desc = "Show LSP Implementation" })

vim.keymap.set("n", "<leader>hr", gitsigns.reset_hunk, { desc = "gitsigns reset hunk" })

vim.keymap.set("v", "<leader>fs", function()
	local visual_selection = get_visual_selection()
	fzf.lgrep_curbuf({ query = visual_selection })
end, { desc = "Search visual selection in Buffer" })

vim.keymap.set("v", "<leader>fgs", function()
	local visual_selection = get_visual_selection()
	fzf.live_grep({ query = visual_selection })
end, { desc = "Search visual selection in project" })

vim.keymap.set("v", "<leader>rs", function()
	grugfar.with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })
end, { desc = "Replace visual selection in Buffer" })

vim.keymap.set("v", "<leader>rgs", function()
	grugfar.with_visual_selection()
end, { desc = "replace visual selection in project" })

vim.keymap.set("n", "cc", "ggdG", { desc = "clear buffer" })
