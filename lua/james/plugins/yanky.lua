return {
    "gbprod/yanky.nvim",
    opts = {},
    dependencies = { "folke/snacks.nvim" },
    lazy = false,
    keys = {
        {
            "<leader>p",
            function()
                if vim.g.vscode then
                    vim.cmd("YankyRingHistory")
                else
                    Snacks.picker.yanky()
                end
            end,
            mode = { "n", "x" },
            desc = "Open Yank History"
        },
    },
    config = function()
        require("yanky").setup({
            ring = {
                storage = "memory",
                -- When pasting text from windows system clipboard, there's always a ^M at the end of each line. Adding a permeant wrapper to remove these ^M characters when pasting will allows you to paste text from windows system clipboard without any issues.
                permanent_wrapper = require("yanky.wrappers").remove_carriage_return,
            },
            preserve_cursor_position = {
                enabled = true,
            },
            system_clipboard = {
                sync_with_ring = true,
            },
        })

        vim.keymap.set('n', '<leader>m', function()
            local format_title = function(item)
                local regtype_map = {
                    v = "charwise",
                    V = "linewise",
                }
                local regtype_text = regtype_map[item.regtype] or "blockwise"

                if item.filetype == nil then
                    return regtype_text
                end

                return regtype_text .. " (" .. item.filetype .. ")"
            end

            Snacks.picker.pick({
                title = "Select yanky history to system clipboard",
                finder = function()
                    local items = {}
                    for index, value in pairs(require("yanky.history").all()) do
                        value.key = index
                        value.text = tostring(value.regcontents)
                        items[#items + 1] = value
                    end
                    return items
                end,
                confirm = function(picker, item)
                    picker:close()
                    if item then
                        vim.fn.setreg('+', item.text)
                    end
                    print("copied to system clipboard")
                end,
                format = function(item)
                    return {
                        {
                            Snacks.picker.util.align(tostring(item.idx), #tostring(item.idx), { align = "right" }),
                            "SnacksPickerIdx",
                            virtual = true,
                        },
                        { " ",             virtual = true },
                        { item.regcontents },
                    }
                end,
                preview = function(ctx)
                    ctx.preview:reset()
                    ctx.preview:set_lines(ctx.item.regcontents and vim.split(ctx.item.regcontents, "\n") or {})
                    ctx.preview:set_title(format_title(ctx.item))
                    ctx.preview:highlight({ ft = ctx.item.filetype or "text" })
                end,
            })
        end, { desc = 'Copy yanky history to system clipboard' })
    end
}
