-- vim.opt.smarttab = true
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
-- vim.cmd("set smartindent")
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

  _G.indent_info = "Indent:" .. width
end, { nargs = 1 })

vim.api.nvim_create_autocmd("BufEnter", { command = "SetIndent 2" })

vim.opt.wrap = true
vim.opt.hlsearch = false
vim.opt.breakindent = true
-- newline on file save
vim.opt.fixendofline = false

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "number"
vim.cmd("set cursorline")

vim.cmd("set clipboard=unnamedplus")

vim.opt.termguicolors = true

-- folding
vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldtext = ""
vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({ fold = " " })

-- default to tressitter folding
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"

-- Prefer LSP folding if client supports it
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/foldingRange') then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end
  end,
})
