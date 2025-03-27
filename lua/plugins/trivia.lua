return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function()
      require("ibl").setup()
    end,
  },
  {
    "numToStr/Comment.nvim",
    opts = {},
    config = function()
      require("Comment").setup()
    end,
  },
}
