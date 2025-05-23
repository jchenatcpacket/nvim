-- historical cutomization reference for future reuse

-- customized statys column 
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
-- highlight current line, to hide and only use number highlight uncomment " set cursorlineopt
-- set signwidth to always show and limit to 1 char so stuff doesn't move when LSP error occurs
vim.cmd("set signcolumn=yes:1")

-- customize status column
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

-- customize cursor
vim.opt.guicursor = "n:block-blinkwait700-blinkoff400-blinkon250,i:ver25-blinkwait700-blinkoff400-blinkon250"

-- Hide cursor in inactive windows
vim.opt.guicursor:append("a:Cursor/lCursor")
vim.api.nvim_create_autocmd({"WinLeave"}, {
  callback = function()
    vim.opt.guicursor:append("a:Cursor-blinkon0")
  end
})
vim.api.nvim_create_autocmd({"WinEnter"}, {
  callback = function()
    vim.opt.guicursor:remove("a:Cursor-blinkon0")
  end
})