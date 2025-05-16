-- vim.opt.smarttab = true
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set smartindent")
vim.cmd("set shiftwidth=4")
vim.cmd("set autoindent")

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

  print("Indent set to " .. width)
end, { nargs = 1 })

vim.api.nvim_create_autocmd("BufEnter", { command = "SetIndent 4" })

vim.opt.wrap = true
vim.opt.hlsearch = false
vim.opt.breakindent = true
-- newline on file save
vim.opt.fixendofline = false

vim.cmd("set relativenumber")
vim.cmd("set cursorline")

vim.cmd("set clipboard=unnamedplus")
