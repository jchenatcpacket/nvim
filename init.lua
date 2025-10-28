if vim.g.vscode then
    -- VSCode extension
else
    -- ordinary Neovim
    -- require('customize')
    -- require('keymaps')
    -- require('mymenu')
    -- require("old.lazy")
    require('cus')
    require("james.lazy")
end