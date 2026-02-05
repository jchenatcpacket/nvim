vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.o.timeoutlen = 2000

vim.filetype.add({
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
	},
	pattern = {
		[".*compose.*%.ya?ml"] = "yaml.docker-compose",
	},
})

vim.filetype.add({
	extension = {
		["http"] = "http",
	},
})

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

require("james.lazy")
require("james.lsp")
require("common")
require("keymaps")
require("commands")

-- right click menu
-- vim.cmd("aunmenu PopUp")

vim.cmd([[
  amenu PopUp.Copy\ abs\ Filepath <cmd>let @+ = expand('%:p')<cr>
  amenu PopUp.Go\ to\ Definition <cmd>lua vim.lsp.buf.definition()<CR>
]])
