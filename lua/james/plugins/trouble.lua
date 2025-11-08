return {
  "folke/trouble.nvim",
  opts = {},   -- for default options, refer to the configuration section for custom setup.
  cmd = "Trouble",
  keys = {
    {
      "<leader>xx",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      desc = "Diagnostics (Trouble)",
    },
  },
  config = function()
    require("trouble").setup({
      focus = false,
      follow = true,
      win = {
        position = "right",
      }
    })
  end
}
