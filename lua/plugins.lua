return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("onedark").setup({
        style = "dark",
      })
      require("onedark").load()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        indent = { enable = true },
        ensure_installed = { "lua" },
        sync_install = false,
        ignore_install = { "javascript" },
        highlight = {
          enable = true,
          disable = { "c", "rust" },
          additional_vim_regex_highlighting = false,
        }
      })
    end
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    lazy = false,
    opts = {},
    config = function()
      require('neo-tree').setup {
        filesystem = {
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
            hide_gitignored = true,
          },
        }
      }
      vim.keymap.set("n", "<leader>nt", ":Neotree filesystem reveal left<CR>", {})
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    options = {
      theme = "dracula",
    },
  },
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
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  }
}
