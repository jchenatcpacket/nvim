return {
  "saghen/blink.cmp",
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = "1.*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
      ["<Tab>"] = { "select_and_accept", 'fallback' },
      ["<CR>"] = { "select_and_accept", 'fallback' },

      ['<Up>'] = { 'select_prev', 'fallback' },
      ['<Down>'] = { 'select_next', 'fallback' },
    },

    appearance = {
      nerd_font_variant = "mono",
    },

    completion = { documentation = { auto_show = false } },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
  cond = not vim.g.vscode,
}
