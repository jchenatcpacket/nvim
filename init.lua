vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.g.vscode then
    -- VSCode extension
else
    require('common')
    require("james.lazy")
end
