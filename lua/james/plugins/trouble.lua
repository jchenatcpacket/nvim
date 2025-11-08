return {
  "folke/trouble.nvim",
  opts = {
    {
      focus = false,
      follow = true,
      win = {
        position = "right",
      }
    }
  }, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {},
  cond = not vim.g.vscode,
}
