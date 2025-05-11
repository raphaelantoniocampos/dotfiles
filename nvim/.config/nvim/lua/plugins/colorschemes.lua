-- Colorschemes
return {
  require('custom.save-colors').lazy_setup {
    -- List all colorscheme plugins here.
    { 'folke/tokyonight.nvim' },
    { 'RRethy/base16-nvim', pattern = 'base16%-' }, -- <- `pattern`
    { 'EdenEast/nightfox.nvim' },
    {
      'Mofiqul/dracula.nvim',
      lazy = false,
      priority = 100,
    },
    { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true },

    {
      'folke/tokyonight.nvim',
      lazy = false,
      priority = 1000,
      opts = {},
    },
    {
      'scottmckendry/cyberdream.nvim',
      lazy = false,
      priority = 1000,
    },

    {
      'clearaspect/onehalf',
      lazy = false,
      priority = 1000,
    },

    {
      'vague2k/vague.nvim',
      lazy = false,
      priority = 1000,
    },

    { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },

    { 'nyoom-engineering/oxocarbon.nvim', name = 'oxocarbon', priority = 1000 },

    {
      'drewxs/ash.nvim',
      lazy = false,
      priority = 1000,
    },

    {
      'rose-pine/neovim',
      lazy = false,
      priority = 1000,
      name = 'rose-pine',
    },

    {
      'rebelot/kanagawa.nvim',
      lazy = false,
      priority = 1000,
    },

    -- Use themery to live preview themes
    -- {
    --   'zaldih/themery.nvim',
    --   lazy = false,
    --   config = function()
    --     require('themery').setup {
    --   themes = {
    --     'ash',
    --     'catppuccin-latte',
    --     'catppuccin-frappe',
    --     'catppuccin-macchiato',
    --     'catppuccin-mocha',
    --     'cyberdream',
    --     'dracula',
    --     'gruvbox',
    --     'kanagawa-dragon',
    --     'kanagawa-lotus',
    --     'kanagawa-wave',
    --     'onehalfdark',
    --     'onehalflight',
    --     'oxocarbon',
    --     'rose-pine',
    --     'tokyonight-day',
    --     'tokyonight-moon',
    --     'tokyonight-night',
    --     'tokyonight-storm',
    --     'vague',
    --   }, -- Your list of installed colorschemes.
    --   livePreview = true, -- Apply theme while picking. Default to true.
    --     }
    --   end,
    -- },
  },
}
