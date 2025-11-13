return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        picker = { enabled = true },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = true },
        statuscolumn = { enabled = false },
        words = { enabled = false },

        lazygit = {
            -- your lazygit configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            configure = true,
            win = {
                style = "lazygit",
            },
        }
    },
    config = function()
        vim.api.nvim_create_user_command('Lazygit', function()
            Snacks.lazygit()
        end, { desc = "lazygit" })
    end
}
