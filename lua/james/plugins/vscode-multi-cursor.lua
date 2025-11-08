return {
    "vscode-neovim/vscode-multi-cursor.nvim",
    event = "VeryLazy",
    cond = not not vim.g.vscode,
    opts = {},
    config = function()
        local cursors = require("vscode-multi-cursor")

        cursors.setup {         -- Config is optional
            -- Whether to set default mappings
            default_mappings = true,
            -- If set to true, only multiple cursors will be created without multiple selections
            no_selection = false
        }

        vim.keymap.set({ "n", "x" }, "mc", cursors.create_cursor, { expr = true, desc = "Create cursor" })
        vim.keymap.set({ "n" }, "mcc", cursors.cancel, { desc = "Cancel/Clear all cursors" })
        vim.keymap.set({ "n", "x" }, "mi", cursors.start_left, { desc = "Start cursors on the left" })
        vim.keymap.set({ "n", "x" }, "mI", cursors.start_left_edge, { desc = "Start cursors on the left edge" })
        vim.keymap.set({ "n", "x" }, "ma", cursors.start_right, { desc = "Start cursors on the right" })
        vim.keymap.set({ "n", "x" }, "mA", cursors.start_right, { desc = "Start cursors on the right" })
        vim.keymap.set({ "n" }, "[mc", cursors.prev_cursor, { desc = "Goto prev cursor" })
        vim.keymap.set({ "n" }, "]mc", cursors.next_cursor, { desc = "Goto next cursor" })
        vim.keymap.set({ "n" }, "mcs", cursors.flash_char, { desc = "Create cursor using flash" })
        vim.keymap.set({ "n" }, "mcw", cursors.flash_word, { desc = "Create selection using flash" })
    end
}
