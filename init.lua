vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.filetype.add({
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
		["compose.yaml"] = "yaml.docker-compose",
		["docker-compose.dev.yml"] = "yaml.docker-compose",
	},
	pattern = {
		["*compose*%.ya?ml"] = "yaml.docker-compose",
	},
})

require("james.lazy")
require("james.lsp")
require("common")
require("keymaps")
require("commands")
