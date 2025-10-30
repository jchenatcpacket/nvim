vim.opt.number = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.autoindent = true

vim.cmd("set list")

vim.api.nvim_create_user_command("SetIndent", function(opts)
  local width = tonumber(opts.args)

  if width ~= 2 and width ~= 4 then
    vim.api.nvim_err_writeln("Error: Indent must be either 2 or 4")
    return
  end

  if width == 2 then
    vim.cmd([[set listchars=leadmultispace:▏\ ]])
  elseif width == 4 then
    vim.cmd([[set listchars=leadmultispace:▏\ \ \ ]])
  end

  vim.opt.tabstop = width
  vim.opt.softtabstop = width
  vim.opt.shiftwidth = width

  _G.indent_count = width
end, { nargs = 1 })

vim.api.nvim_create_autocmd("BufEnter", { command = "SetIndent 4" })

vim.cmd([[match TrailingSpace /\s\+$/]])
vim.cmd("hi TrailingSpace ctermbg=238 guibg=#4D0000")

vim.keymap.set("i", "<C-s>", "<cmd>w<cr><Esc>", { desc = "insert mode, save file" })
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "normal mode, save file" })
vim.keymap.set("i", "<D-s>", "<cmd>w<cr><Esc>", { desc = "insert mode, save file" })
vim.keymap.set("n", "<D-s>", "<cmd>w<cr>", { desc = "normal mode, save file" })