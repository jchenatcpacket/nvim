return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gitsigns = require("gitsigns")
      gitsigns.setup({
        signs = {
          add = { text = "A" },
          change = { text = "C" },
          delete = { text = "D" },
          topdelete = { text = "tD" },
          changedelete = { text = "cD" },
          untracked = { text = "U" },
        },
        signs_staged = {
          add = { text = "A" },
          change = { text = "C" },
          delete = { text = "D" },
          topdelete = { text = "tD" },
          changedelete = { text = "cD" },
          untracked = { text = "U" },
        },
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 500,
          ignore_whitespace = false,
          virt_text_priority = 100,
          use_focus = true,
        },
        current_line_blame_formatter = "<summary> • <author_time:%R> • <author>",
      })

      vim.keymap.set({ 'n', 'o', 'x' }, '<leader>hs', gitsigns.select_hunk, { desc = "git select hunk" })
      vim.keymap.set('n', '<leader>hr', gitsigns.reset_hunk, { desc = "git reset hunk" })
      vim.keymap.set('n', '<leader>hp', gitsigns.preview_hunk, { desc = "git preview hunk" })
      vim.keymap.set('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = "git preview hunk inline" })
      vim.keymap.set('n', '<leader>hd', gitsigns.diffthis, { desc = "git diff" })
      vim.keymap.set('n', '<leader>td', gitsigns.toggle_deleted, { desc = "git toggle deleted" })
      vim.keymap.set('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = "git word diff" })
    end
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
        enabled = true,
        message_template = "<summary> • <date> • <author> • <<sha>>",
        date_format = "%m-%d-%Y", -- full datetime "%m-%d-%Y %H:%M:%S",
        virtual_text_column = 1,
        display_virtual_text = 0
      },
  }
}
