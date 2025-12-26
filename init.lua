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

require("james.lazy")
require("james.lsp")
require("common")
require("keymaps")
require("commands")
