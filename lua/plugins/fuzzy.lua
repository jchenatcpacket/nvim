return {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- or if using mini.icons/mini.nvim
    -- dependencies = { "echasnovski/mini.icons" },
    opts = {},
    config = function()
        require("fzf-lua").setup()
        vim.keymap.set("n", "<C-p>", "<CMD>FzfLua files<CR>", { desc = "search filenames" })
        vim.keymap.set("n", "<C-o>", "<CMD>FzfLua grep_curbuf<CR>", { desc = "search current buffer" })
        vim.keymap.set("n", "<leader>gall", "<CMD>FzfLua grep_project<CR>", { desc = "search all project lines" })
    end,
}
