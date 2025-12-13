return {
	{
		"mfussenegger/nvim-dap",
		enabled = false,
		lazy = true,
		-- Copied from LazyVim/lua/lazyvim/plugins/extras/dap/core.lua and
		-- modified.
		keys = {
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},

			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				desc = "Continue",
			},

			{
				"<leader>dC",
				function()
					require("dap").run_to_cursor()
				end,
				desc = "Run to Cursor",
			},

			{
				"<leader>dT",
				function()
					require("dap").terminate()
				end,
				desc = "Terminate",
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		enabled = false,
		---@type MasonNvimDapSettings
		opts = {
			-- This line is essential to making automatic installation work
			-- :exploding-brain
			handlers = {},
			automatic_installation = {
				-- These will be configured by separate plugins.
				exclude = {
					"delve",
					"python",
				},
				"nvim-neotest/nvim-nio",
			},
			-- DAP servers: Mason will be invoked to install these if necessary.
			ensure_installed = {
				-- "codelldb",
				-- "python",
			},
		},
		dependencies = {
			"mfussenegger/nvim-dap",
			"williamboman/mason.nvim",
		},
	},
	{
		"mfussenegger/nvim-dap-python",
		enabled = false,
		lazy = true,
		config = function()
			local python = vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
			require("dap-python").setup(python)
		end,
		-- Consider the mappings at
		-- https://github.com/mfussenegger/nvim-dap-python?tab=readme-ov-file#mappings
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		"leoluz/nvim-dap-go",
		enabled = false,
		config = true,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		keys = {
			{
				"<leader>dt",
				function()
					require("dap-go").debug_test()
				end,
				desc = "Debug test",
			},
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		enabled = false,
		config = true,
		dependencies = {
			"mfussenegger/nvim-dap",
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		enabled = false,
		config = true,
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "Dap UI",
			},
		},
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			"leoluz/nvim-dap-go",
			"mfussenegger/nvim-dap-python",
			"theHamsta/nvim-dap-virtual-text",
		},
	},
}
