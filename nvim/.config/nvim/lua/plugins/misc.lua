-- Standalone plugins with less than 10 lines of config go here
return {
  {
    -- autoclose tags
    'windwp/nvim-ts-autotag',
  },
  {
    -- detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',
  },
  {
    -- Powerful Git integration for Vim
    'tpope/vim-fugitive',
  },
  {
    -- GitHub integration for vim-fugitive
    'tpope/vim-rhubarb',
  },

  {
    -- Autoclose parentheses, brackets, quotes, etc.
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
    opts = {},
  },
  {
    -- Highlight todo, notes, etc in comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },
  {
    -- high-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  {
    'jghauser/fold-cycle.nvim',
    config = function()
      require('fold-cycle').setup()
      vim.keymap.set('n', '<leader>fo', function()
        return require('fold-cycle').open()
      end, { silent = true, desc = 'Fold-cycle: open folds' })
      vim.keymap.set('n', '<leader>fx', function()
        return require('fold-cycle').close()
      end, { silent = true, desc = 'Fold-cycle: close folds' })
      vim.keymap.set('n', '<leader>F', function()
        return require('fold-cycle').close_all()
      end, { remap = true, silent = true, desc = 'Fold-cycle: close all folds' })
    end,
  },
}
