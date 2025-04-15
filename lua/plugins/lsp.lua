return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "gopls" },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require('lspconfig')
  
      lspconfig['lua_ls'].setup({ capabilities = capabilities })
      lspconfig['pyright'].setup({ capabilities = capabilities })
      lspconfig['gopls'].setup({ capabilities = capabilities })
    end
  },
}
