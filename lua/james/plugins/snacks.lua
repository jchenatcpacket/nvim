return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
    },
    config = function()
        vim.api.nvim_create_user_command('Lazygit', function()
            Snacks.lazygit()
        end, { desc = "Lazygit" })

        vim.api.nvim_create_user_command('Explorer', function()
            Snacks.explorer()
        end, { desc = "File Explorer" })
    end
}
