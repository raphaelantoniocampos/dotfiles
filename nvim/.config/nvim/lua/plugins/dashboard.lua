return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = {
          enable = true,
        },
        shortcut = {
          { desc = 'µ Update', group = '@property', action = 'Lazy update', key = 'u' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' Health',
            group = 'DiagnosticHint',
            action = 'checkhealth',
            key = 'h',
          },
          {
            desc = ' Dot Files',
            group = 'Number',
            action = function()
              require('telescope.builtin').find_files {
                cwd = '~/dotfiles/',
                follow = true,
                hidden = true,
                no_ignore = false,
                no_ignore_parent = false,
                file_ignore_patterns = { '.git/' },
              }
            end,
            key = '.',
          },
        },
      },
      -- config
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
