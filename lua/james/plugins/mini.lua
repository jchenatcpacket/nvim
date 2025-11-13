return {
    {
        "nvim-mini/mini.pairs",
        version = "*",
        config = function()
            require('mini.pairs').setup()
        end
    },
    {
        "nvim-mini/mini.indentscope",
        version = '*',
        config = function ()
            require('mini.indentscope').setup()
        end
    }
}