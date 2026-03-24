vim.keymap.set("i", "<C-s>", "<cmd>w<cr><Esc>", { desc = "insert mode, save file" })
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "normal mode, save file" })

vim.keymap.set("i", "<Tab>", function()
	return string.rep(" ", vim.opt.softtabstop:get())
end, { expr = true, noremap = true })

vim.keymap.set("n", "cc", "ggdG", { desc = "clear buffer" })

vim.keymap.set({ "n", "v" }, "<C-w>1", ":1wincmd c<cr>", { desc = "close window 1" })
vim.keymap.set({ "n", "v" }, "<C-w>2", ":2wincmd c<cr>", { desc = "close window 2" })
vim.keymap.set({ "n", "v" }, "<C-w>3", ":3wincmd c<cr>", { desc = "close window 3" })
vim.keymap.set({ "n", "v" }, "<C-w>4", ":4wincmd c<cr>", { desc = "close window 4" })
vim.keymap.set({ "n", "v" }, "<C-w>5", ":5wincmd c<cr>", { desc = "close window 5" })
