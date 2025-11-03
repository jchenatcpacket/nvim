return {
  { "nvzone/volt", lazy = false },
  {
    "nvzone/menu",
    lazy = false,
    config = function()
      local fzf = require("fzf-lua")

      local options = {
        {
          name = "Echo Test",
          cmd = function()
            local current_WORD = vim.fn.expand('<cWORD>')
            print(current_WORD)
          end,
          rtxt = "<NOP>",
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

        { name = "separator" },

        {
          name = "Goto Definition",
          cmd = vim.lsp.buf.definition,
          rtxt = "<NOP>",
        },

        {
          name = "Goto Implementation",
          cmd = vim.lsp.buf.implementation,
          rtxt = "<NOP>",
        },

        { name = "separator" },

        {
          name = "Show Reference",
          cmd = function()
            local current_WORD = vim.fn.expand('<cWORD>')
            fzf.lsp_references({query = current_WORD})
          end,
          rtxt = "<NOP>",
        },
        {
          name = "Show Definition",
          cmd = function()
            local current_WORD = vim.fn.expand('<cWORD>')
            fzf.lsp_definitions({query = current_WORD})
          end,
          rtxt = "<NOP>",
        },
        {
          name = "Show Declaration",
          cmd = function()
            local current_WORD = vim.fn.expand('<cWORD>')
            fzf.lsp_declarations({query = current_WORD})
          end,
          rtxt = "<NOP>",
        },
        {
          name = "Show Typedef",
          cmd = function()
            local current_WORD = vim.fn.expand('<cWORD>')
            fzf.lsp_typedefs({query = current_WORD})
          end,
          rtxt = "<NOP>",
        },
        {
          name = "Show Implementation",
          cmd = function()
            local current_WORD = vim.fn.expand('<cWORD>')
            fzf.lsp_implementations({query = current_WORD})
          end,
          rtxt = "<NOP>",
        }
      }

      vim.keymap.set("n", "<C-t>", function()
        require("menu").open(options)
      end, {})
    end
  },
}
