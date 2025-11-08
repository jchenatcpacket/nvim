return {
  "ibhagwan/fzf-lua",
  dependencies = { "DaikyXendo/nvim-material-icon" },
  opts = {},
  config = function ()
    local fzf = require("fzf-lua")
    vim.keymap.set({ "n", "v", "i" }, "<C-f>",
    function() fzf.grep_curbuf() end,
    { silent = true, desc = "search current buffer" })

    vim.keymap.set({ "n", "v", "i" }, "<C-p>",
    function() fzf.files() end,
    { silent = true, desc = "find files" })
  end,
  cond = not vim.g.vscode,
}
