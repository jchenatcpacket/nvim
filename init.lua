vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.vscode then
    require("vscode")
else
    require('common')
    require("james.lazy")
end
