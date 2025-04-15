vim.cmd("set clipboard=unnamedplus")
vim.cmd("set autoindent")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<Tab>", ">>", {})
vim.keymap.set("n", "<S-Tab>", "<<", {})

vim.keymap.set("n", "<C-z>", "u", { desc = "Undo in normal mode" })

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

if vim.g.vscode then
	require("lazy").setup({
		spec = {
			{
				"folke/flash.nvim",
				event = "VeryLazy",
				---@type Flash.Config
				opts = {},
        -- stylua: ignore
        keys = {
          { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
          { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
          { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
          { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
          { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
			},
		},
		install = {},
		checker = { enabled = true },
	})
else
	vim.cmd("set expandtab")
	vim.cmd("set tabstop=2")
	vim.cmd("set softtabstop=2")
	vim.cmd("set shiftwidth=2")
	vim.cmd("set smartindent")
	vim.opt.hlsearch = false
	vim.opt.smarttab = true
	vim.opt.wrap = true
	vim.opt.breakindent = true

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
	vim.opt.statuscolumn = '%s%=%{&relativenumber ? ( v:virtnum == 0 ? printf("%s", v:lua.custom_statuscol()) : " " ) : ""} '

	-- show diagnostics inline
	vim.diagnostic.config({ virtual_text = true })

	vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Save file in insert mode" })
	vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save file in normal mode" })
	vim.keymap.set("i", "<S-Tab>", "<C-d>", {})
	vim.keymap.set("i", "<C-z>", "<Esc>ui", { desc = "Undo in insert mode" })

	require("lazy").setup("plugins")
end
