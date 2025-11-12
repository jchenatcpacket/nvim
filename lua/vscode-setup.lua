local vscode = require("vscode")

vim.g.clipboard = vim.g.vscode_clipboard

vim.keymap.set("n", "<leader>tr", function()
    vscode.action("editor.action.trimTrailingWhitespace")
    print("Trimmed trailing whitespace")
end, { desc = "trim trailing whitespace" })

vim.keymap.set("n", "<leader>fm", function()
    vscode.action("editor.action.formatDocument")
    print("Formatted document")
end, { desc = "format document" })

vim.keymap.set("v", "<leader>fm", function()
    local start_line = vim.fn.line("v") - 1
    local end_line = vim.fn.line(".") - 1
    vscode.action("editor.action.formatSelection", {
        range = { start_line, end_line }
    })
    print("Formated visual selection")
end, { desc = "format visual selection" })

vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
        -- vscode.action("errorLens.toggle")
        vscode.update_config("errorLens.enabled", false, "global")
    end,
})

vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
        vscode.update_config("errorLens.enabled", true, "global")
    end,
})