return {
    "neovim/nvim-lspconfig",
    opts = {
        autoformat = false,
    },
    config = function()
        local capabilities = require("blink.cmp").get_lsp_capabilities()
        local lspconfig = require("lspconfig")

        lspconfig.lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                },
            },
            capabilities = capabilities,
        })
        lspconfig.pyright.setup({ capabilities = capabilities })
        lspconfig.gopls.setup({ capabilities = capabilities })
        lspconfig.rust_analyzer.setup({ capabilities = capabilities })
        lspconfig.dockerfile_language_server.setup({ capabilities = capabilities })
        lspconfig.docker_compose_language_service.setup({ capabilities = capabilities })

        vim.diagnostic.enable(true)
        vim.diagnostic.config({
            virtual_text = true,
            signs = false,
            underline = true,
            update_in_insert = true,
            severity_sort = true,
        })

        vim.api.nvim_create_user_command("LspDiag", function()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end, { nargs = 0 })

        vim.api.nvim_create_autocmd("InsertEnter", {
            callback = function()
                -- hide lsp diag virt text
                vim.diagnostic.enable(false)
            end,
        })

        vim.api.nvim_create_autocmd("InsertLeave", {
            callback = function()
                -- shown lsp diag virt text
                vim.diagnostic.enable(true)
            end,
        })
    end
}
