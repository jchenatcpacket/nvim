return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	cond = not vim.g.vscode,
}
