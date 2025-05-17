local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

local callback = function(selection)
  local fzf = require("fzf-lua")
  if selection == "grep project" then
    fzf.grep_project()
  elseif selection == "grep current buffer" then
    fzf.grep_curbuf()
  elseif selection == "find files" then
    fzf.files()
  elseif selection == "find lsp workspace symbols" then
    fzf.lsp_workspace_symbols()
  elseif selection == "find lsp document symbols" then
    fzf.lsp_document_symbols()
  else
    print("not implmented yet: " .. selection)
  end
end

local menu = Menu(
  {
    position = "50%",
    size = {
      width = 25,
      height = 5,
    },
    border = {
      style = "single",
      text = {
        top = "MyMenu",
        top_align = "center",
      },
    },
    win_options = {
      winhighlight = "Normal:Normal,FloatBorder:Normal",
    },
  },
  {
    lines = {
      Menu.separator("Fzf"),
      Menu.item("grep project"),
      Menu.item("grep current buffer"),
      Menu.item("find files"),
      Menu.item("find lsp workspace symbols"),
      Menu.item("find lsp document symbols"),
    },
    max_width = 20,
    keymap = {
      focus_next = { "j", "<Down>", "<Tab>" },
      focus_prev = { "k", "<Up>", "<S-Tab>" },
      close = { "<Esc>", "<C-c>" },
      submit = { "<CR>", "<Space>" },
    },
    on_close = function()
      print("MyMenu Closed!")
    end,
    on_submit = function(item)
      local selection = item.text
      callback(selection)
    end,
  }
)

vim.keymap.set("n", "<leader>m", function()
  menu:mount()
end, { desc = "show MyMenu" })
