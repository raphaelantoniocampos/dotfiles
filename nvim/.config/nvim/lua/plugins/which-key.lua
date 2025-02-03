return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts_extend = { 'spec' },
  opts = {
    win = {
      border = {
        { '┌', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '┐', 'FloatBorder' },
        { '│', 'FloatBorder' },
        { '┘', 'FloatBorder' },
        { '─', 'FloatBorder' },
        { '└', 'FloatBorder' },
        { '│', 'FloatBorder' },
      },
    },
    preset = 'helix',
    defaults = {},
    spec = {
      {
        mode = { 'n', 'v' },
        { '<leader>T', group = 'tabs' },
        { '<leader>W', group = 'workspaces', icon = { icon = '󰒖', color = 'yellow' } },
        { '<leader>c', group = 'code' },
        { '<leader>d', group = 'debug' },
        { '<leader>f', group = 'fold', icon = { icon = '󰅂', color = 'yellow' } },
        { '<leader>l', group = 'lazy', icon = { icon = '💤' } },
        { '<leader>u', group = 'UI', icon = { icon = '🎨' } },
        { '<leader>m', group = 'mason', icon = { icon = '🧱' } },
        { '<leader>s', group = 'search' },
        { '<leader>a', group = 'avante', icon = { icon = '✨', color = 'orange' } },
        { '<leader>S', group = 'session' },
        { '<leader>\\', group = 'neotree', icon = { icon = '󰙅', color = 'blue' } },
        { '<leader>g', group = 'git' },
        { '<leader>x', group = 'diagnostics/quickfix', icon = { icon = '󱖫 ', color = 'green' } },
        { '[', group = 'prev' },
        { ']', group = 'next' },
        { 'g', group = 'goto' },
        {
          '<leader><Tab>',
          group = 'buffer',
          expand = function()
            return require('which-key.extras').expand.buf()
          end,
        },
        {
          '<leader>w',
          group = 'windows',
          proxy = '<c-w>',
          expand = function()
            return require('which-key.extras').expand.win()
          end,
        },
        -- better descriptions
        { 'gx', desc = 'Open with system app' },
      },
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show { global = false }
      end,
      desc = 'Buffer Keymaps (which-key)',
    },
    {
      '<c-w><space>',
      function()
        require('which-key').show { keys = '<c-w>', loop = true }
      end,
      desc = 'Window Hydra Mode (which-key)',
    },
  },
  config = function(_, opts)
    local wk = require 'which-key'
    wk.setup(opts)
    if not vim.tbl_isempty(opts.defaults) then
      LazyVim.warn 'which-key: opts.defaults is deprecated. Please use opts.spec instead.'
      wk.register(opts.defaults)
    end
  end,
}
