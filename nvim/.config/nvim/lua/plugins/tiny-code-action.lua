return {
  'rachartier/tiny-code-action.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
  },
  event = 'LspAttach',
  config = function()
    local tiny_code_action = require 'tiny-code-action'
    tiny_code_action.setup()
    vim.keymap.set('n', '<leader>ca', function()
      tiny_code_action.code_action()
    end, { noremap = true, silent = true })
  end,
}
