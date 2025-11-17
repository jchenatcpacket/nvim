return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	cond = not vim.g.vscode,
	config = function()
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
		-- vim.lsp.config("pyright", {
		-- 	cmd = { "docker", "exec", "-i", "python-node-app", "bash", "-lc", "npx pyright-langserver --stdio" },
		-- 	root_markers = {
		-- 		"pyrightconfig.json",
		-- 		"pyproject.toml",
		-- 		"setup.py",
		-- 		"setup.cfg",
		-- 		"requirements.txt",
		-- 		"Pipfile",
		-- 		".git",
        --         "main.py",
		-- 	},
		-- 	before_init = function(params)
		-- 		params.processId = vim.NIL
		-- 	end,
		-- })
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("pyright")
		vim.lsp.enable("rust_analyzer")
		vim.lsp.enable("gopls")
		vim.lsp.enable("dockerfilels")
		vim.lsp.enable("docker_compose_language_service")

		vim.diagnostic.enable(true)
		vim.diagnostic.config({
			virtual_text = true,
			signs = false,
			underline = true,
			update_in_insert = true,
			severity_sort = true,
		})

		vim.api.nvim_create_autocmd("InsertEnter", {
			callback = function()
				-- hide lsp diag virt text
				vim.diagnostic.enable(false)
			end,
		})

		vim.api.nvim_create_autocmd("InsertLeave", {
			callback = function()
				-- shown lsp diag virt text
				vim.diagnostic.enable(true)
			end,
		})
	end,
}
