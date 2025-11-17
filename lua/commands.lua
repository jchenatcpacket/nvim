vim.api.nvim_create_user_command('Lazygit', function()
  Snacks.lazygit()
end, { desc = "Lazygit" })

vim.api.nvim_create_user_command('Terminal', function()
  Snacks.terminal()
end, { desc = "Snacks Terminal" })

vim.api.nvim_create_user_command('Explorer', function()
  Snacks.explorer()
end, { desc = "File Explorer" })

vim.api.nvim_create_user_command("InlineDiagnostics", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { nargs = 0, desc = "Toggle inline diagnostics" })

vim.api.nvim_create_user_command("InlayLspHints", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end, { nargs = 0, desc = "Toggle inlay lsp type hints" })

local billboard = function(text)
  local Popup = require("nui.popup")
  local event = require("nui.utils.autocmd").event

  local popup = Popup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
    },
    position = "50%",
    size = {
      width = "70%",
      height = "50%",
    },
  })

  -- mount/open the component
  popup:mount()

  -- unmount component when cursor leaves buffer
  popup:on(event.BufLeave, function()
    popup:unmount()
  end)

  -- set content
  vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, vim.split(text, "\n"))
end

vim.api.nvim_create_user_command("QuickAction", function()
  local items = {}
  local longest_name = 0
  local actions = {
    {
      name = "lsp ref",
      comment = "show lsp ref",
      action = function()
        billboard("show lsp ref")
      end,
    },
    {
      name = "lsp def",
      comment = "show lsp def",
      action = function()
        billboard("show lsp def")
      end,
    }
  }
  for index, item in ipairs(actions) do
    table.insert(items, {
      idx = index,
      name = item.name,
      text = item.comment,
      action = item.action
    })
    -- longest_name = math.max(longest_name, #workspace.name)
  end
  longest_name = longest_name + 2
  return Snacks.picker.pick({
    title = "Quick Action",
    items = items,
    format = function(item)
      local ret = {}
      ret[#ret + 1] = { ('%-' .. longest_name .. 's'):format(item.name), 'SnacksPickerLabel' }
      ret[#ret + 1] = { item.text, 'SnacksPickerComment' }
      return ret
    end,
    confirm = function(picker, item)
      picker:close()
      item.action()
    end,
    preview = false
  })
end, { nargs = 0, desc = "quick actions list" })

vim.api.nvim_create_user_command("Surround", function()
  local content = [=[
    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    surr*ound_words             ysiw(           ( surround_words )
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
]=]
  billboard(content)
end, { nargs = 0, desc = "Surround help" })
