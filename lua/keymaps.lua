vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "<C-s>", "<cmd>w<cr><Esc>", { desc = "insert mode, save file" })
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "normal mode, save file" })
vim.keymap.set("i", "<D-s>", "<cmd>w<cr><Esc>", { desc = "insert mode, save file" })
vim.keymap.set("n", "<D-s>", "<cmd>w<cr>", { desc = "normal mode, save file" })

vim.keymap.set('n', '<leader>m', function()
    local content = vim.fn.getreg('"')
    local regtype = vim.fn.getregtype('"')
    vim.fn.setreg('*', content, regtype)
    print("Copied to system clipboard")
end, { desc = 'Copy unnamed register to system clipboard' })

vim.keymap.set('i', '<Tab>', function()
  return string.rep(' ', vim.opt.softtabstop:get())
end, { expr = true, noremap = true })

vim.keymap.set({'n', "v"}, 'D', '"_d', { noremap = true, desc = "capital D to delete to blackhole" })