vim.opt.number = true
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.autoindent = true

-- insert mode cursor blinking
vim.o.guicursor = table.concat({
  "n-v-c:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "i-ci:ver25-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100",
  "r:hor50-Cursor/lCursor-blinkwait100-blinkon100-blinkoff100"
}, ",")

-- wsl clipboard
if vim.fn.has("wsl") == 1 then
  vim.api.nvim_exec(
  [[
    let g:clipboard = {
    \   'name': 'win32yank-wsl',
    \   'copy': {
    \      '+': 'win32yank.exe -i --crlf',
    \      '*': 'win32yank.exe -i --crlf',
    \    },
    \   'paste': {
    \      '+': 'win32yank.exe -o --lf',
    \      '*': 'win32yank.exe -o --lf',
    \   },
    \   'cache_enabled': 0,
    \ }
  ]],
  true
)
end

vim.api.nvim_create_user_command("SetIndent", function(opts)
  local width = tonumber(opts.args)

  if width ~= 2 and width ~= 4 then
    vim.api.nvim_err_writeln("Error: Indent must be either 2 or 4")
    return
  end

  -- set list will interfere with expandtab by showing tab character as ^I instead of space
  -- unless set listchars specify how it handles tab characters is shown
  -- vim.cmd("set list")
  -- if width == 2 then
  --   vim.cmd([[set listchars=leadmultispace:▏\ ]])
  -- elseif width == 4 then
  --   vim.cmd([[set listchars=leadmultispace:▏\ \ \ ]])
  -- end

  vim.opt.tabstop = width
  vim.opt.softtabstop = width
  vim.opt.shiftwidth = width

  _G.indent_count = width
end, { nargs = 1, desc = "Set Indent spaces to either 2 or 4" })

vim.api.nvim_create_autocmd("VimEnter", { command = "SetIndent 4" })

vim.cmd([[match TrailingSpace /\s\+$/]])
vim.cmd("hi TrailingSpace ctermbg=238 guibg=#4D0000")

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        -- highlight on yank
        vim.highlight.on_yank()

        -- copy to system clipboard
        local event = vim.v.event
        if event.operator == "y" and event.regname == "" then
            vim.fn.setreg("+", event.regcontents, event.regtype)
        end
    end,
})
