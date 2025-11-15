return {
    'MagicDuck/grug-far.nvim',
    -- Note (lazy loading): grug-far.lua defers all it's requires so it's lazy by default
    -- additional lazy config to defer loading is not really needed...
    config = function()
        -- optional setup call to override plugin options
        -- alternatively you can set options with vim.g.grug_far = { ... }
        require('grug-far').setup({
            -- options, see Configuration section below
            -- there are no required options atm
        });

        -- replace within current file
        -- require('grug-far').open({ prefills = { paths = vim.fn.expand("%") } })

        -- replace current word
        -- require('grug-far').open({ prefills = { search = vim.fn.expand("<cword>") } })

        -- replace visual selection globally
        -- require('grug-far').open({ visualSelectionUsage = 'operate-within-range' })

        -- replace visual selection within current file
        -- require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })
    end
}
