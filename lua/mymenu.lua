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

local popup_options = {
  relative = "win",
  position = {
    row = "55%",
    col = "33%"
  },
  size = {
    width = 40,
    height = 20,
  },
  border = {
    style = "rounded",
    text = {
      top = "MyMenu",
      top_align = "center",
    },
  },
  win_options = {
    winhighlight = "Normal:Normal,FloatBorder:Normal",
  },
  focusable = true
}

local menu = Menu(popup_options, {
  lines = {
    Menu.separator("Fzf"),
    Menu.item("grep project", { id = 1 }),
    Menu.item("grep current buffer", { id = 2 }),
    Menu.item("find files", { id = 3 }),
    Menu.item("find lsp workspace symbols", { id = 4 }),
    Menu.item("find lsp document symbols", { id = 5 }),
  },
  -- max_width = 20,
  keymap = {
    focus_next = { "j", "<Down>" },
    focus_prev = { "k", "<Up>" },
    close = { "<Esc>" },
    submit = { "<CR>" },
  },

  on_close = function()
    print("MyMenu Closed!")
  end,

  on_submit = function(item)
    local selection = item.text
    callback(selection)
  end,
})

vim.keymap.set("n", "<leader>m", function()
  menu:mount()
end, { desc = "show MyMenu" })

menu:on({ event.BufLeave }, function()
  menu:unmount()
end, { once = true })
