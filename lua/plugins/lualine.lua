return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = {
          -- left = "",
          left = ">",
          right = "",
        },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
          "neo-tree"
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = false,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          function()
            local git_blame = require('gitblame')

            if git_blame.is_blame_text_available() then
              return git_blame.get_current_blame_text()
            end
          end
        },
        lualine_x = {
          {
            function()
              return _G.indent_info
            end
          },
          {
            "diagnostics",
            -- Table of diagnostic sources, available sources are:
            --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
            -- or a function that returns a table as such:
            --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
            sources = { "nvim_diagnostic" },

            -- Displays diagnostics for the defined severity types
            sections = { "error", "warn", "info", "hint" },

            diagnostics_color = {
              -- Same values as the general color option can be used here.
              error = "DiagnosticError", -- Changes diagnostics' error color.
              warn = "DiagnosticWarn",   -- Changes diagnostics' warn color.
              info = "DiagnosticInfo",   -- Changes diagnostics' info color.
              hint = "DiagnosticHint",   -- Changes diagnostics' hint color.
            },
            symbols = { error = "E", warn = "W", info = "I", hint = "H" },
            colored = true,           -- Displays diagnostics status in color if set to true.
            update_in_insert = false, -- Update diagnostics in insert mode.
            always_visible = false,   -- Show diagnostics even if there are none.
          },
        },
        lualine_y = { "location", "progress", 'encoding', 'fileformat', 'filetype' },
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
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filetype",
            colored = true,
            icon_only = true,
          },
          {
            "filename",
            path = 3,
          },
          {
            "navic",
            color_correction = "dynamic",
            navic_opts = { highlight = true },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          {
            "filetype",
            colored = true,
            icon_only = true,
          },
          {
            "filename",
            path = 3
          }
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      -- tabline = {
      --   lualine_a = { 'buffers' },
      --   lualine_b = { 'branch' },
      --   lualine_c = { 'filename' },
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = { 'tabs' }
      -- }
    })
  end,
}
