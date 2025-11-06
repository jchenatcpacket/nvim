require("keymaps")

if vim.g.vscode then
    require("vsc")
else
    require('common')
    require("james.lazy")
end
