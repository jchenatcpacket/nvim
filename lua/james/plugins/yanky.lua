return {
    "gbprod/yanky.nvim",
    opts = {},
    dependencies = { "folke/snacks.nvim" },
    keys = {
        {
            "<leader>p",
            function()
                Snacks.picker.yanky()
            end,
            mode = { "n", "x" },
            desc = "Open Yank History"
        },
    },
    config = function()
        require("yanky").setup({
            ring = {
                storage = "memory",
                -- When pasting text from windows system clipboard, there's always a ^M at the end of each line. Adding a permeant wrapper to remove these ^M characters when pasting will allows you to paste text from windows system clipboard without any issues.
                permanent_wrapper = require("yanky.wrappers").remove_carriage_return,
            },
            preserve_cursor_position = {
                enabled = true,
            },
        })
    end
}
