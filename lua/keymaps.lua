vim.keymap.set("i", "<C-s>", "<cmd>w<cr><Esc>", { desc = "insert mode, save file" })
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "normal mode, save file" })

vim.keymap.set("i", "<Tab>", function()
	return string.rep(" ", vim.opt.softtabstop:get())
end, { expr = true, noremap = true })

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader>ljd", vim.lsp.buf.definition, { desc = "Jump to LSP Definition" })

vim.keymap.set("n", "<leader>lji", vim.lsp.buf.implementation, { desc = "Jump to LSP Implementation" })

vim.keymap.set("n", "<leader>lr", function()
	fzf.lsp_references({ jump1 = false })
end, { desc = "Show LSP Reference" })

vim.keymap.set("n", "<leader>ld", function()
	fzf.lsp_definitions({ jump1 = false })
end, { desc = "Show LSP Definition" })

vim.keymap.set("n", "<leader>lc", function()
	fzf.lsp_declarations({ jump1 = false })
end, { desc = "Show LSP Declaration" })

vim.keymap.set("n", "<leader>lt", function()
	fzf.lsp_typedefs({ jump1 = false })
end, { desc = "Show LSP Typedef" })

vim.keymap.set("n", "<leader>li", function()
	fzf.lsp_implementations({ jump1 = false })
end, { desc = "Show LSP Implementation" })

vim.keymap.set("n", "cc", "ggdG", { desc = "clear buffer" })

vim.keymap.set("n", "<leader>lh", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
end, { desc = "toggle lsp inlay type hints" })
