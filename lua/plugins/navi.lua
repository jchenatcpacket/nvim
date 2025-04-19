return {
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        opts = {},
        config = function()
            require("fzf-lua").setup({})
            vim.keymap.set("n", "<C-p>", "<CMD>FzfLua files<CR>", { desc = "search filenames" })
            vim.keymap.set("n", "<C-o>", "<CMD>FzfLua grep_curbuf<CR>", { desc = "search current buffer" })
            vim.keymap.set("n", "<leader>gall", "<CMD>FzfLua grep_project<CR>", { desc = "search all project lines" })
            vim.keymap.set("n", "<leader>fld", "<CMD>FzfLua lsp_definitions<CR>", { desc = "lsp definition" })
            vim.keymap.set("n", "<leader>flr", "<CMD>FzfLua lsp_references<CR>", { desc = "lsp reference" })
            vim.keymap.set("n", "<leader>fli", "<CMD>FzfLua lsp_implementations<CR>", { desc = "lsp implementation" })
        end,
    },
    -- {
    --     "folke/trouble.nvim",
    --     lazy = false,
    --     cmd = "Trouble",
    --     config = function()
    --         require('trouble').setup({
    --             focus = true,
    --             auto_preview = true,
    --             warn_no_results = true,
    --             open_no_results = true,
    --             win = {
    --                 type = "float",
    --                 position = "center",
    --                 size = 0.8,
    --             },
    --         })
    --         vim.keymap.set("n", "<leader>tld", "<cmd>Trouble lsp_definitions<cr>", { desc = "trouble lsp definition" })
    --     end,
    -- },
    {
        "stevearc/aerial.nvim",
        opts = {},
        -- Optional dependencies
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            require("aerial").setup({
                layout = {
                    max_width = 0.8,
                    width = nil,
                    min_width = 80,
                },
                filter_kind = {
                    "Class",
                    "Constructor",
                    "Enum",
                    "Function",
                    "Interface",
                    "Module",
                    "Method",
                    "Struct",
                },
                -- optionally use on_attach to set keymaps when aerial has attached to a buffer
                on_attach = function(bufnr)
                    -- Jump forwards/backwards with '{' and '}'
                    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
                end,
                float = {
                    relative = "win",
                    max_height = 0.9,
                    height = nil,
                    min_height = { 8, 0.1 },
                },
            })
            -- You probably also want to set a keymap to toggle aerial
            vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle! float<CR>")
            vim.keymap.set("n", "q", "<cmd>AerialClose<CR>")
        end,
    },
    {
        "rmagatti/goto-preview",
        dependencies = { "rmagatti/logger.nvim" },
        event = "BufEnter",
        config = function ()
            require('goto-preview').setup({
                focus_on_open = true,
                zindex = 1,
                vim_ui_input = true,
            })
        end,
        keys = {
            {
                "<leader>pd",
                "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
                noremap = true,
                desc = "goto preview definition",
            },
            {
                "<leader>pD",
                "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>",
                noremap = true,
                desc = "goto preview declaration",
            },
            {
                "<leader>pi",
                "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
                noremap = true,
                desc = "goto preview implementation",
            },
            {
                "<leader>py",
                "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>",
                noremap = true,
                desc = "goto preview type definition",
            },
            {
                "<leader>pr",
                "<cmd>lua require('goto-preview').goto_preview_references()<CR>",
                noremap = true,
                desc = "goto preview references",
            },
            {
                "<leader>P",
                "<cmd>lua require('goto-preview').close_all_win()<CR>",
                noremap = true,
                desc = "close all preview windows",
            },
        },
    },
}
