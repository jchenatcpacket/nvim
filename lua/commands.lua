vim.api.nvim_create_user_command('Lazygit', function()
  Snacks.lazygit()
end, { desc = "Lazygit" })

vim.api.nvim_create_user_command('Explorer', function()
  Snacks.explorer()
end, { desc = "File Explorer" })

vim.api.nvim_create_user_command("InlineDiagnostics", function()
    vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { nargs = 0, desc = "Toggle inline diagnostics" })

vim.api.nvim_create_user_command("InlayLspHints", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({0}),{0})
end, { nargs = 0, desc = "Toggle inlay lsp type hints" })