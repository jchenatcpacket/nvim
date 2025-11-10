return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      symbols = {
        focus = false,
        follow = true,
        win = {
          type = "split",     -- split window
          relative = "win",   -- relative to current window
          position = "right", -- right side
          size = 0.4
          ,                   -- 30% of the window
        },
      },
    }
  }, -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>td",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
    {
      "<leader>ts",
      "<cmd>Trouble symbols toggle<cr>",
      desc = "Symbols (Trouble)",
    },
  },
  cond = not vim.g.vscode,
}
