return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			files = {
				-- rg_opts = [[--color=never --hidden --files -g '!{.git,node_modules,.cargo}']],
				-- fd_opts = [[--color=never --hidden --type f --type l --exclude .git --exclude .cargo]],
			},
			grep = {
				-- rg_opts = [[--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -e -g '!{.git,node_modules,.cargo}']],
				hidden = true,
			},
		})
		fzf.register_ui_select()

		vim.keymap.set({ "n" }, "<leader>sb", function()
			fzf.buffers()
		end, { desc = "search buffers" })

		vim.keymap.set({ "n" }, "<leader>sf", function()
			fzf.files({ resume = true })
		end, { desc = "search files" })

		vim.keymap.set({ "n" }, "<leader>st", function()
			fzf.tabs()
		end, { desc = "search tabs" })

		vim.keymap.set({ "n" }, "<leader>sl", function()
			fzf.grep({ resume = true })
		end, { desc = "search last" })

		vim.keymap.set({ "n" }, "<leader>sr", function()
			fzf.resume()
		end, { desc = "resume search" })

		vim.keymap.set({ "n", "v" }, "<leader>sk", function()
			fzf.keymaps({ winopts = { preview = { hidden = true } } })
		end, { desc = "search keymaps" })

		vim.keymap.set({ "n", "v" }, "<leader>sc", function()
			fzf.commands({ winopts = { preview = { hidden = true } } })
		end, { desc = "search commands" })

		vim.keymap.set("v", "<leader>sv", function()
			fzf.grep_visual({ resume = true })
		end, { desc = "Search visual" })
		vim.keymap.set("n", "<leader>sc", function()
			fzf.grep_curbuf({ resume = true })
		end, { desc = "grep buffer" })
		vim.keymap.set("n", "<leader>sp", function()
			fzf.grep_project({ resume = true })
		end, { desc = "grep project" })
		vim.keymap.set("n", "<leader>sw", function()
			fzf.grep_cword()
		end, { desc = "Search word" })
		vim.keymap.set("n", "<leader>sW", function()
			fzf.grep_cWORD()
		end, { desc = "Search WORD" })
		vim.keymap.set({ "n" }, "<C-f>", ":FzfLua ", { desc = "fzflua command" })

		vim.keymap.set("n", "<leader>lr", function()
			fzf.lsp_references({ jump1 = false })
		end, { desc = "Show LSP Reference" })

		vim.keymap.set("n", "<leader>ld", function()
			fzf.lsp_definitions({ jump1 = false })
		end, { desc = "Show LSP Definition" })

		vim.keymap.set("n", "<leader>lc", function()
			fzf.lsp_declarations({ jump1 = false })
		end, { desc = "Show LSP Declaration" })

		vim.keymap.set("n", "<leader>lt", function()
			fzf.lsp_typedefs({ jump1 = false })
		end, { desc = "Show LSP Typedef" })

		vim.keymap.set("n", "<leader>li", function()
			fzf.lsp_implementations({ jump1 = false })
		end, { desc = "Show LSP Implementation" })

		vim.keymap.set("n", "<leader>dd", function()
            fzf.diagnostics_document()
		end, { desc = "Show document diagnostics" })
		vim.keymap.set("n", "<leader>dw", function()
			fzf.diagnostics_workspace()
		end, { desc = "Show workspace diagnostics" })
	end,
}
