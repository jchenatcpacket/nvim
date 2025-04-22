vim.opt.smarttab = true
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")

vim.cmd("set smartindent")
vim.cmd("set shiftwidth=4")

vim.cmd("set list")
vim.cmd([[set listchars=trail:…,nbsp:+,tab:│\ ,leadmultispace:▏\ ,multispace:┊\ ,eol:↵]])

vim.opt.wrap = true
vim.opt.hlsearch = false

vim.opt.breakindent = true
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set autoindent")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<C-z>", "<cmd>u<cr>", { desc = "normal mode, undo" })
vim.keymap.set("i", "<C-s>", "<cmd>w<cr><Esc>", { desc = "insert mode, save file" })
vim.keymap.set("n", "<C-s>", "<cmd>w<cr>", { desc = "normal mode, save file" })
vim.keymap.set("i", "<C-z>", "<cmd>ui<cr>", { desc = "insert mode, undo" })

-- set hightlight colors (overriden by colorscheme, hence after)
vim.cmd([[highlight LineNr guifg=#6c7086]])
vim.cmd([[highlight CursorLineNr guifg=#cdd6f4 "guibg=#313244]])
vim.cmd([[highlight LineNrAbove guifg=#eba0ac]])
vim.cmd([[highlight LineNrBelow guifg=#94e2d5]])
-- set line number to be a bit darker
vim.cmd([[hi Status_LineNr guifg=#6c7086]])
-- color background the same als normal but color text light grey, use 'Vertical Line Extension' ⏐ unicode U+23d0
vim.cmd([[hi Status_DivLine guibg=#1e1e2e guifg=#313244]])
-- set number + set relativenumber to use in 'statuscolumn ='
vim.cmd("set number")
vim.cmd("set relativenumber")
-- highlight current line, to hide and only use number highlight uncomment " set cursorlineopt
vim.cmd("set cursorline")
-- set signwidth to always show and limit to 1 char so stuff doesn't move when LSP error occurs
vim.cmd("set signcolumn=yes:1")

_G.custom_statuscol = function()
	local current_line = vim.api.nvim_win_get_cursor(0)[1]
	local absolute_line = vim.v.lnum
	local line_diff = absolute_line - current_line
	if line_diff == 0 then
		return string.format("%d|%d", vim.v.relnum, vim.v.lnum)
	elseif line_diff < 0 then
		return string.format("%dk|%d", vim.v.relnum, vim.v.lnum)
	else
		return string.format("%dj|%d", vim.v.relnum, vim.v.lnum)
	end
end
vim.opt.statuscolumn = '%s%=%{&relativenumber ? ( v:virtnum < 1 ? printf("%s", v:lua.custom_statuscol()) : " " ) : ""} '

-- cursor customize
vim.opt.guicursor = "n:block-blinkwait700-blinkoff400-blinkon250,i:ver25-blinkwait700-blinkoff400-blinkon250"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvigit"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
