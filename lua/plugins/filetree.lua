return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		lazy = false,
		config = function()
			require("neo-tree").setup({
				enable_git_status = true,
				git_status = {
					symbols = {
						-- Change type
						added = "add", -- or "✚", but this is redundant info if you use git_status_colors on the name
						modified = "modified", -- or "", but this is redundant info if you use git_status_colors on the name
						deleted = "deleted", -- this can only be used in the git_status source
						renamed = "renamed", -- this can only be used in the git_status source
						-- Status type
						untracked = "untracked",
						ignored = "ignored",
						unstaged = "unstaged",
						staged = "staged",
						conflict = "conflict",
					},
				},
				enable_diagnostics = true,
				window = {
					position = "float",
					mappings = {
						["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
						-- Read `# Preview Mode` for more information
						["l"] = "focus_preview",
						["af"] = {
							"add",
							-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
							-- some commands may take optional config options, see `:h neo-tree-mappings` for details
							config = {
								show_path = "none", -- "none", "relative", "absolute"
							},
						},
						["ad"] = "add_directory",
						["m"] = "move",
						["d"] = "delete",
						["r"] = "rename_basename",
						["q"] = "cancel",
						["s"] = "open_vsplit",
						["t"] = "open_tabnew",
					},
				},
				filesystem = {
					filtered_items = {
						visible = false, -- when true, they will just be displayed differently than normal items
						hide_dotfiles = false,
						hide_gitignored = false,
						hide_hidden = false, -- only works on Windows for hidden files/directories
						hide_by_name = {
							--"node_modules"
						},
						hide_by_pattern = { -- uses glob style patterns
							--"*.meta",
							--"*/src/*/tsconfig.json",
						},
						always_show = { -- remains visible even if other settings would normally hide it
							".gitignored",
						},
						always_show_by_pattern = { -- uses glob style patterns
							".env*",
						},
						never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
							".DS_Store",
							".git",
						},
						never_show_by_pattern = { -- uses glob style patterns
							--".null-ls_*",
						},
					},
				},
			})

			vim.keymap.set("n", "<leader>nt", "<Cmd>Neotree toggle<CR>")
		end,
	},
}
