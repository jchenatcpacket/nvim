return {
  { "nvzone/volt", lazy = false },
  {
    "nvzone/menu",
    lazy = false,
    config = function()
      local fzf = require("fzf-lua")

      local options = {
        {
          name = "Test test test",
          cmd = function()
            local current_WORD = vim.fn.expand('<cWORD>')
            print(current_WORD)
          end,
          rtxt = "",
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
          name = "Show Reference",
          cmd = function()
            local current_WORD = vim.fn.expand('<cWORD>')
            fzf.lsp_references({query = current_WORD})
          end,
          rtxt = "<leader>gSomething",
        }
      }

      vim.keymap.set("n", "<C-t>", function()
        require("menu").open(options)
      end, {})
    end
  },
}
