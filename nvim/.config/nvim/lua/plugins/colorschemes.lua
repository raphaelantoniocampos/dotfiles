-- Use themery to live preview themes
return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
  themes = {
          "ash",
          "dracula",
'tokyonight-night',
'tokyonight-storm',
'tokyonight-day',
'tokyonight-moon',
          "cyberdream",
          "onehalflight",
          "onehalfdark",
          "vague",
          'catppuccin-latte',
          'catppuccin-frappe',
          'catppuccin-macchiato',
          'catppuccin-mocha',
          'lackluster-hack',
'kanagawa-wave',
'kanagawa-dragon',
'kanagawa-lotus',
        }, -- Your list of installed colorschemes.
  livePreview = true, -- Apply theme while picking. Default to true.
      })
    end
  },

-- Colorschemes

  {
  'Mofiqul/dracula.nvim',
  lazy = false,
  priority = 100,
  },
{
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
},
{
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
},

{
    'clearaspect/onehalf',
    lazy = false,
    priority = 1000,
},

{
  "vague2k/vague.nvim",
    lazy = false,
    priority = 1000,
},

{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },

{
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
},

{
    "drewxs/ash.nvim",
    lazy = false,
    priority = 1000,
},

{
	"rose-pine/neovim",
    lazy = false,
    priority = 1000,
	name = "rose-pine",
},
{
'elvessousa/sobrio',
    lazy = false,
    priority = 1000,
},

{
"rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
},
  }


