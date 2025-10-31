-- linux keymaps
vim.keymap.set("n", "<C-z>", "<cmd>undo<cr>", { desc = "undo in normal mode"})
vim.keymap.set("i", "<C-s>", "<cmd>w<cr><Esc>", { desc = "insert mode, save file" })
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "normal mode, save file" })

-- macos keymaps: <D> is cmd key
vim.keymap.set("n", "<D-z>", "<cmd>undo<cr>", { desc = "undo in normal mode"})
vim.keymap.set("i", "<D-s>", "<cmd>w<cr><Esc>", { desc = "insert mode, save file" })
vim.keymap.set("n", "<D-s>", "<cmd>w<cr>", { desc = "normal mode, save file" })