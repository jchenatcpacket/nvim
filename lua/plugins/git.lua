return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    config = function ()
      require('gitsigns').setup()
    end
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
    config = function ()
      vim.keymap.set({"n"}, "<leader>dfo", "<cmd>DiffviewOpen<cr>", { desc = "normal mode, diffview open" })
      vim.keymap.set({"n"}, "<leader>dfc", "<cmd>DiffviewClose<cr>", { desc = "normal mode, diffview close" })
    end
  },
  {
    "kdheepak/lazygit.nvim",
    lazy = false,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
}