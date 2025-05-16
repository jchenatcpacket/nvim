return {
  "akinsho/toggleterm.nvim",
  version = "*",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      direction = "float",
    })

    vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "floating terminal" })
  end,
}
