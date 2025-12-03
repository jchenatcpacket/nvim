return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "VeryLazy" },
		lazy = vim.fn.argc(-1) == 0,
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				indent = { enable = true },
				ensure_installed = { "lua", "python", "rust", "dockerfile", "yaml" },
				sync_install = false,
				ignore_install = { "javascript" },
				highlight = {
					enable = true,
					disable = { "c" },
					additional_vim_regex_highlighting = false,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
							["]b"] = "@block.outer",
							["]a"] = "@parameter.inner",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
							["]B"] = "@block.outer",
							["]A"] = "@parameter.inner",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
							["[b"] = "@block.outer",
							["[a"] = "@parameter.inner",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
							["[B"] = "@block.outer",
							["[A"] = "@parameter.inner",
						},
					},
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							-- ["af"] = "@function.outer",
							-- ["if"] = "@function.inner",
							-- ["ac"] = "@class.outer",
							-- ["ic"] = "@class.inner",
							-- ["ab"] = "@block.outer",
							-- ["ib"] = "@block.inner",
							-- ["al"] = "@loop.outer",
							-- ["il"] = "@loop.inner",
							-- ["a/"] = "@comment.outer",
							-- ["i/"] = "@comment.outer", -- no inner for comment
							-- ["aa"] = "@parameter.outer", -- parameter -> argument
							-- ["ia"] = "@parameter.inner",
						},
					},
				},
			})
		end,
	},
}
