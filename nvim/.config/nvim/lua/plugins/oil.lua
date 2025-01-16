return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
  config = function()
    require('oil').setup {
      columns = {
        'icon',
        -- 'permissions',
        'size',
        -- 'mtime',
      },
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
    }
  end,
}
