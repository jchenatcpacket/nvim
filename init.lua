vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.vscode then
    require("vsc")
else
    require('common')
    require("james.lazy")
end
