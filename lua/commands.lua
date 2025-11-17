vim.api.nvim_create_user_command("Lazygit", function()
	Snacks.lazygit()
end, { desc = "Lazygit" })

vim.api.nvim_create_user_command("Terminal", function()
	Snacks.terminal()
end, { desc = "Snacks Terminal" })

vim.api.nvim_create_user_command("Explorer", function()
	Snacks.explorer()
end, { desc = "File Explorer" })

vim.api.nvim_create_user_command("InlineDiagnostics", function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { nargs = 0, desc = "Toggle inline diagnostics" })

vim.api.nvim_create_user_command("InlayLspHints", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 })
end, { nargs = 0, desc = "Toggle inlay lsp type hints" })

vim.api.nvim_create_user_command("Surround", function()
	local text = [[
    Old text                    Command         New text
--------------------------------------------------------------------------------
    surr*ound_words             ysiw)           (surround_words)
    surr*ound_words             ysiw(           ( surround_words )
    *make strings               ys$"            "make strings"
    [delete ar*ound me!]        ds]             delete around me!
    remove <b>HTML t*ags</b>    dst             remove HTML tags
    'change quot*es'            cs'"            "change quotes"
    <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
    delete(functi*on calls)     dsf             function calls
]]

	local Popup = require("nui.popup")
	local event = require("nui.utils.autocmd").event

	local popup = Popup({
		enter = true,
		focusable = true,
		border = {
			style = "rounded",
		},
		position = "50%",
		size = {
			width = "70%",
			height = "50%",
		},
	})

	popup:mount()

	popup:on(event.BufLeave, function()
		popup:unmount()
	end)

	popup:map("n", "<esc>", function()
		popup:unmount()
	end, { noremap = true })

	vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, vim.split(text, "\n"))
end, { nargs = 0, desc = "Surround help" })
