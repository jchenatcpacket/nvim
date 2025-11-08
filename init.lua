require("keymaps")
require("james.lazy")

if vim.g.vscode then
    require("vscode-setup")
else
    require('common')
end
