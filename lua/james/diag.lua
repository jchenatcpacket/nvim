local diag_signs = {
	text = {
		[vim.diagnostic.severity.ERROR] = "",
		[vim.diagnostic.severity.WARN] = "",
		[vim.diagnostic.severity.INFO] = "",
		[vim.diagnostic.severity.HINT] = "",
	},
}

vim.diagnostic.config({
	virtual_text = false,
	underline = false,
	float = {
		border = "rounded",
		format = function(diagnostic)
			local severity = vim.diagnostic.severity[diagnostic.severity]
			return string.format("(%s) %s: %s", severity, diagnostic.source, diagnostic.message)
		end,
	},
	severity_sort = true,
	signs = diag_signs,
})

vim.keymap.set("n", "<leader>dc", function()
	vim.diagnostic.open_float({ scope = "cursor" })
end, { desc = "show cursor diagnostics" })
vim.keymap.set("n", "<leader>dl", function()
	vim.diagnostic.open_float({ scope = "line" })
end, { desc = "show line diagnostics" })

vim.api.nvim_create_user_command("ToggleUndercurl", function()
	local current = vim.diagnostic.config()
	vim.diagnostic.config({ underline = not current.underline })
end, { desc = "Toggle diagnostics undercurl" })

vim.api.nvim_create_user_command("ToggleSigns", function()
	local current = vim.diagnostic.config()
	if type(current.signs) == "table" then
		vim.diagnostic.config({ signs = false })
	else
		vim.diagnostic.config({ signs = diag_signs })
	end
end, { desc = "Toggle diagnostics signs" })
