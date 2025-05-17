return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    config = function()
      local fzf = require("fzf-lua")

      fzf.setup({
        lsp = {
          jump1 = false, -- jump_to_single_result = false
        },
      })

      vim.keymap.set("n", "<C-p>", function()
        fzf.files()
      end, { desc = "search filenames" })

    end,
  },
}
