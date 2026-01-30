return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			grep = {
				-- include hidden files for grep
				hidden = true,
			},
		})
		fzf.register_ui_select()

		local function get_visual_selection()
			local s_start = vim.fn.getpos("'<")
			local s_end = vim.fn.getpos("'>")
			local n_lines = math.abs(s_end[2] - s_start[2]) + 1
			local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
			lines[1] = string.sub(lines[1], s_start[3], -1)
			if n_lines == 1 then
				lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
			else
				lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
			end
			return table.concat(lines, "\n")
		end

		vim.keymap.set({ "n", "v" }, "<leader>b", function()
			fzf.buffers()
		end, { desc = "buffer list" })

		vim.keymap.set({ "n", "v" }, "<leader>?k", function()
			fzf.keymaps({ winopts = { preview = { hidden = true } } })
		end, { desc = "search Keymaps" })

		vim.keymap.set({ "n", "v" }, "<leader>?c", function()
			fzf.commands({ winopts = { preview = { hidden = true } } })
		end, { desc = "search Commands" })

		vim.keymap.set("v", "<leader>ss", function()
			local visual_selection = get_visual_selection()
			fzf.grep_curbuf({ query = visual_selection })
		end, { desc = "Search visual selection in Buffer" })

		vim.keymap.set("v", "<leader>sgs", function()
			local visual_selection = get_visual_selection()
			fzf.grep_project({ query = visual_selection })
		end, { desc = "Search visual selection in project" })
		vim.keymap.set("v", "<leader>sv", fzf.grep_visual, { desc = "Search visual" })
		vim.keymap.set("n", "<leader>sw", fzf.grep_cword, { desc = "Search word" })
		vim.keymap.set("n", "<leader>sW", fzf.grep_cWORD, { desc = "Search WORD" })
		vim.keymap.set({ "n" }, "<C-f>", ":FzfLua ", { desc = "fzflua command" })
	end,
}
