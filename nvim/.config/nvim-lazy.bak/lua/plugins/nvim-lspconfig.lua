return {
  "neovim/nvim-lspconfig",
  dependencies = {},
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
