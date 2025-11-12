return {
  { "nvzone/volt", lazy = false },
  {
    "nvzone/menu",
    lazy = false,
    cond = not vim.g.vscode,
    config = function()
      local fzf = require("fzf-lua")

      local function get_visual_selection()
        local start_pos = vim.fn.getpos("'<")
        local end_pos = vim.fn.getpos("'>")

        local lines = vim.api.nvim_buf_get_text(
          0,
          start_pos[2] - 1,
          start_pos[3] - 1,
          end_pos[2] - 1,
          end_pos[3],
          {}
        )

        return table.concat(lines, '\n')
      end

      local options = {
        {
          name = "Echo cWORD",
          cmd = function()
            local current_WORD = vim.fn.expand('<cWORD>')
            print(current_WORD)
          end,
          -- rtxt = "<NOP>",
        },
        {
          name = "Jump Back",
          cmd = function()
            vim.cmd('normal! <C-o>')
          end,
          rtxt = "<C-o>",
        },
        {
          name = "Jump Forward",
          cmd = function()
            vim.cmd('normal! <C-i>')
          end,
          rtxt = "<C-i>",
        },
        {
          name = "Format Buffer",
          cmd = function()
            local conform = require("conform")
            conform.format({
              lsp_fallback = true,
              async = false,
              timeout_ms = 500,
            })
          end,
          rtxt = "<leader>fm",
        },

        {
          name = "Toggle Inlay Hints",
          cmd = function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}),{0})
          end,
          -- rtxt = "<leader>fm",
        },

        { name = "separator" },

        {
          name = "Search in Buffer",
          cmd = function()
            local current_WORD = vim.fn.expand('<cWORD>')
            fzf.lgrep_curbuf({ query = current_WORD })
          end
        },

        {
          name = "Search in Project",
          cmd = function()
            local current_WORD = vim.fn.expand('<cWORD>')
            fzf.live_grep({ query = current_WORD })
          end
        },

        { name = "separator" },

        {
          name = "Goto Definition",
          cmd = vim.lsp.buf.definition,
          -- rtxt = "<NOP>",
        },

        {
          name = "Goto Implementation",
          cmd = vim.lsp.buf.implementation,
          -- rtxt = "<NOP>",
        },

        { name = "separator" },

        {
          name = "Show LSP Reference",
          cmd = function()
            local word = vim.fn.expand('<cword>')
            fzf.lsp_references({ jump1 = false })
          end,
          -- rtxt = "<NOP>",
        },
        {
          name = "Show LSP Definition",
          cmd = function()
            local word = vim.fn.expand('<cword>')
            fzf.lsp_definitions({ jump1 = false })
          end,
          -- rtxt = "<NOP>",
        },
        {
          name = "Show LSP Declaration",
          cmd = function()
            local word = vim.fn.expand('<cword>')
            fzf.lsp_declarations({ jump1 = false })
          end,
          -- rtxt = "<NOP>",
        },
        {
          name = "Show LSP Typedef",
          cmd = function()
            -- local word = vim.fn.expand('<cword>')
            fzf.lsp_typedefs({ jump1 = false })
          end,
          -- rtxt = "<NOP>",
        },
        {
          name = "Show LSP Implementation",
          cmd = function()
            local word = vim.fn.expand('<cword>')
            fzf.lsp_implementations({ jump1 = false })
          end,
          -- rtxt = "<NOP>",
        }
      }

      vim.keymap.set("n", "<C-t>", function()
        require("menu").open(options)
      end, {})

      local visual_mode_options = {
        {
          name = "Search in Buffer",
          cmd = function()
            local visual_selection = get_visual_selection()
            fzf.lgrep_curbuf({ query = visual_selection })
          end,
        },

        {
          name = "Search in Project",
          cmd = function()
            local visual_selection = get_visual_selection()
            fzf.live_grep({ query = visual_selection })
          end,
        },
      }
      vim.keymap.set("v", "<C-t>", function()
        require("menu").open(visual_mode_options)
      end, {})
    end
  },
}
