return {
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Diagnostics (Trouble)",
      },
    },
    config = function ()
      require("trouble").setup({
        focus = true,
        follow = false,
        win = {
          type = "float",
          position = "center",
        },
        keys = {
          q = "close",
          o = "jump_close",
          ["<esc>"] = "cancel",
          ["<cr>"] = "jump",
        }
      })
    end
  }
}