vim.opt.number = true
vim.opt.wrap = false
vim.opt.cursorline = true

vim.cmd("hi EoLSpace ctermbg=238 guibg=#4D0000")
vim.cmd([[match EoLSpace /\s\+$/]])

vim.keymap.set("i", "<C-s>", "<cmd>w<cr><Esc>", { desc = "insert mode, save file" })
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "normal mode, save file" })