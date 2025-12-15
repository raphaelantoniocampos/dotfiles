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
        { '<leader>a', group = 'tabs' },
        { '<leader>D', group = 'Dashboard', icon = { icon = '󰡃', color = 'yellow' } },
        { '<leader>t', group = 'terminal', icon = { icon = '' } },
        { '<leader>W', group = 'workspaces', icon = { icon = '󰒖', color = 'yellow' } },
        { '<leader>c', group = 'code' },
        { '<leader>d', group = 'debug' },
        { '<leader>f', group = 'find', icon = { icon = '󰈞' } },
        { '<leader>n', group = 'notes', icon = { icon = '', color = 'white' } },
        { '<leader>H', group = 'Check Health', icon = { icon = '', color = 'green' } },
        { '<leader>L', group = 'Lazy', icon = { icon = '󰒲' } },
        { '<leader>u', group = 'UI', icon = { icon = '', color = 'yellow' } },
        { '<leader>M', group = 'Mason', icon = { icon = '◍', color = 'orange' } },
        { '<leader>s', group = 'search' },
        -- { '<leader>r', group = 'ipython', icon = { icon = '', color = 'green' } },
        { '<leader>S', group = 'session' },
        { '<leader>e', group = 'explorer', icon = { icon = '', color = 'blue' } },
        { '<leader>g', group = 'git' },
        { '<leader>x', group = 'diagnostics', icon = { icon = '󱖫 ', color = 'red' } },
        { '<leader>N', group = 'Neovim News', icon = { icon = ' ', color = 'white' } },
        { '<leader>?', group = 'Buffer Keymaps', icon = { icon = ' ', color = 'green' } },
        { '[', group = 'prev' },
        { ']', group = 'next' },
        { 'g', group = 'goto' },
        {
          '<leader>b',
          group = 'buffer',
          expand = function()
            return require('which-key.extras').expand.buf()
          end,
          icon = { icon = '' },
        },
        {
          '<leader>q',
          icon = { icon = '', color = 'red' },
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
      '<leader>q',
      function()
        Snacks.bufdelete()
      end,
      desc = 'Delete Buffer',
    },
    {
      '<c-w><leader>',
      function()
        require('which-key').show { keys = '<c-w>', loop = true }
      end,
      desc = 'Window Hydra Mode (which-key)',
    },
    {
      '<leader>D',
      function()
        Snacks.dashboard()
      end,
      desc = 'Dashboard',
    },
    {
      '<leader>H',
      function()
        vim.cmd ':checkhealth'
      end,
      desc = 'Check Health',
    },
    {
      '<leader>L',
      function()
        vim.cmd ':Lazy'
      end,
    },
    {
      '<leader>M',
      function()
        vim.cmd ':Mason'
      end,
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
