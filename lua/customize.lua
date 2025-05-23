vim.cmd("set expandtab")
vim.cmd("set autoindent")
-- vim.cmd("set indentexpr=GetPythonIndent(v:lnum)")

-- custom list function to setting indent to 2 or 4
vim.cmd("set list")
vim.api.nvim_create_user_command("SetIndent", function(opts)
  local width = tonumber(opts.args)

  if width ~= 2 and width ~= 4 then
    vim.api.nvim_err_writeln("Error: Indent must be either 2 or 4")
    return
  end

  if width == 2 then
    vim.cmd([[set listchars=trail:…,nbsp:+,tab:│\ ,leadmultispace:▏\ ,multispace:␣,eol:↵]])
  elseif width == 4 then
    vim.cmd([[set listchars=trail:…,nbsp:+,tab:│\ ,leadmultispace:▏\ \ \ ,multispace:␣,eol:↵]])
  end

  vim.opt.tabstop = width
  vim.opt.softtabstop = width
  vim.opt.shiftwidth = width

  _G.indent_info = "Indent:" .. width
end, { nargs = 1 })

vim.api.nvim_create_autocmd("BufEnter", { command = "SetIndent 2" })

vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.breakindent = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"

vim.cmd("set cursorline")

vim.cmd("set clipboard=unnamedplus")

vim.opt.termguicolors = true