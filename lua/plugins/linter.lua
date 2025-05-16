return {
  "mfussenegger/nvim-lint",
  event = {
    "BufReadPre",
    "BufNewFile",
  },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      python = { "pylint" },
    }

    vim.api.nvim_create_user_command("Lint", function()
      lint.try_lint()
    end
    )
  end,
}
