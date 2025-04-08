vim.cmd("set clipboard=unnamedplus")
vim.cmd("set autoindent")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


vim.keymap.set('n', '<Tab>', '>>', {})
vim.keymap.set("n", "<S-Tab>", "<<", {})

vim.keymap.set("n", "<C-z>", "u", { desc = "Undo in normal mode" })

-- vim.keymap.set("n", "clr", function()
--   vim.cmd("normal! gg")
--   vim.cmd("normal! dG")
--   vim.cmd("normal! gg")
-- end, { desc = "Clear file in normal mode" })

vim.api.nvim_create_user_command('ClearFile', '%delete_', {})

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

if vim.g.vscode then
  require("lazy").setup({
    spec = {
      {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
          { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
          { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
          { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
          { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
          { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
      },
    },
    install = {},
    checker = { enabled = true },
  })
else
  vim.cmd("set expandtab")
  vim.cmd("set tabstop=2")
  vim.cmd("set softtabstop=2")
  vim.cmd("set shiftwidth=2")
  vim.cmd("set number")
  vim.cmd("set smartindent")
  vim.cmd("set norelativenumber")
  vim.opt.mouse = 'a'
  vim.opt.hlsearch = false
  vim.opt.smarttab = true
  vim.opt.wrap = true
  vim.opt.breakindent = true

  vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file in insert mode" })
  vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file in normal mode" })
  vim.keymap.set("i", "<S-Tab>", "<C-d>", {})
  vim.keymap.set("i", "<C-z>", "<Esc>ui", { desc = "Undo in insert mode" })

  require("lazy").setup("plugins")
end
