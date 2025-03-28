vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set smartindent")
vim.cmd("set norelativenumber")

vim.opt.mouse = 'a'
vim.opt.hlsearch = false
vim.opt.smarttab = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true, desc = "Save file in insert mode" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = "Save file in normal mode" })
vim.keymap.set("i", "<S-Tab>", "<C-d>", { noremap = true, silent = true, desc = "Unindent line in insert mode" })
vim.keymap.set("n", "<S-Tab>", "<<", { noremap = true, silent = true, desc = "Unindent line in normal mode" })
vim.keymap.set("n", "<C-z>", "u", { noremap = true, silent = true, desc = "Undo in normal mode" })
vim.keymap.set("i", "<C-z>", "<Esc>ui", { noremap = true, silent = true, desc = "Undo in insert mode" })

vim.keymap.set("n", "dn3", "d3w", { noremap = true, silent = true, desc = "deletes next 3 words in normal mode" })

vim.keymap.set("n", "clr", function()
  vim.cmd("normal! gg")
  vim.cmd("normal! dG")
  vim.cmd("normal! gg")
end, { noremap = true, silent = true, desc = "Clear file in normal mode" })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.api.nvim_create_user_command('Hello', function()
  print('Hello, Neovim World!')
end, {})
