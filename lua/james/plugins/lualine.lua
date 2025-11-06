return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("lualine").setup({
            options = {
                component_separators = { left = '│', right = '' },
                section_separators = { left = "", right = "" },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = { "diff", {
                    function()
                        vim.g.gitblame_display_virtual_text = 0 -- Disable virtual text
                        vim.g.gitblame_date_format = "%x"
                        local git_blame = require('gitblame')
                        if git_blame.is_blame_text_available() then
                            return git_blame.get_current_blame_text()
                        else
                            return "Not committed yet"
                        end
                    end
                } },
                lualine_x = { 'diagnostics' },
                lualine_y = {
                    {
                        function()
                            local line = vim.fn.line('.')
                            local col = vim.fn.charcol('.')
                            return string.format('Ln %-d, Col %-d', line, col)
                        end
                    },
                    'progress',
                    { function() return "Spaces:" .. _G.indent_count end },
                    'encoding', 'filetype'
                },
                lualine_z = {
                    {
                        "lsp_status",
                        icon = "", -- f013
                        symbols = {
                            -- Standard unicode symbols to cycle through for LSP progress:
                            spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
                            -- Standard unicode symbol for when LSP is done:
                            done = "✓",
                            -- Delimiter inserted between LSP names:
                            separator = " ",
                        },
                        -- List of LSP names to ignore (e.g., `null-ls`):
                        ignore_lsp = {},
                    },
                },
            },
            winbar = {
                lualine_a = { {
                    "buffers",
                    symbols = {
                        modified = ' ●', -- Text to show when the buffer is modified
                        alternate_file = '#', -- Text to show to identify the alternate file
                        directory = '', -- Text to show when the buffer is a directory
                    }
                } },
                lualine_b = { { "filename", path = 3, } },
                lualine_c = { { "navic", color_correction = "dynamic", navic_opts = { highlight = true } } },
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {
                lualine_a = { "tabs", },
                lualine_b = { "windows" },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {},
            }
        })
    end,
}
