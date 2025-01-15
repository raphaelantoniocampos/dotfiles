return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- "jose-elias-alvarez/typescript.nvim",
  },
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      ruff = {},
      clangd = {},
      gleam = {},
    },
  },
}
