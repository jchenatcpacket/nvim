return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
  end,
  cond = not vim.g.vscode,
}
