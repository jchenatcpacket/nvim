-- code search, file search
-- preview lsp definition, references, etc.
-- outline file functions, classes, types, etc.
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
                }
            })

            vim.keymap.set("n", "<C-p>", function ()
                fzf.files()
            end, { desc = "search filenames" })

            vim.keymap.set("n", "<C-o>", function ()
                fzf.grep_curbuf()
            end, { desc = "search current buffer" })

            vim.keymap.set("n", "<leader>gpj", function ()
                fzf.grep_project()
            end, { desc = "search all project lines" })

            vim.keymap.set("n", "<leader>vdf", function ()
                fzf.lsp_definitions()
            end, { desc = "preview lsp definition" })

            vim.keymap.set("n", "<leader>tdf", function ()
                fzf.lsp_definitions({ jump_to_single_result = true })
            end, { desc = "goto lsp definition" })

            vim.keymap.set("n", "<leader>vtd", function ()
                fzf.lsp_typedefs()
            end, { desc = "preview lsp type definition" })

            vim.keymap.set("n", "<leader>vds", "<CMD>FzfLua lsp_document_symbols<CR>", { desc = "preview lsp Document Symbols" })
            vim.keymap.set("n", "<leader>vws", "<CMD>FzfLua lsp_workspace_symbols<CR>", { desc = "preview lsp Workspace Symbols" })
            vim.keymap.set("n", "<leader>vrf", "<CMD>FzfLua lsp_references<CR>", { desc = "preview lsp reference" })
            vim.keymap.set("n", "<leader>vim", "<CMD>FzfLua lsp_implementations<CR>", { desc = "preview lsp implementation" })
        end,
    },
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

            vim.keymap.set("n", "<leader>ol", "<cmd>AerialOpen float<CR>")
        end,
    },
}
