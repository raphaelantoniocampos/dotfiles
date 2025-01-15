-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "bashls",
      "clang-format",
      "clangd",
      "lua_ls",
      "ruff",
      "shfmt",
      "stylua",
    },
  },
}
