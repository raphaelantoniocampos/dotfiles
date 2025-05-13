return {
  'folke/trouble.nvim',
  cmd = { 'Trouble' },
  opts = {
    modes = {
      lsp = {
        win = { position = 'right' },
      },
    },
  },
  keys = {
    { '<leader>Qo', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Open trouble diagnostics' },
    { '<leader>Qd', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Open trouble document diagnostics' },
    { '<leader>Qs', '<cmd>Trouble symbols toggle<cr>', desc = 'Open trouble symbols' },
    { '<leader>QS', '<cmd>Trouble lsp toggle<cr>', desc = 'Open trouble LSP references/definitions/...' },
    { '<leader>QL', '<cmd>Trouble loclist toggle<cr>', desc = 'Open trouble location list' },
    { '<leader>QQ', '<cmd>Trouble qflist toggle<cr>', desc = 'Open trouble quickfix list' },
    { '<leader>Qt', '<cmd>Trouble todo toggle<CR>', desc = 'Open todos in trouble' },
    {
      '[q',
      function()
        if require('trouble').is_open() then
          require('trouble').prev { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = 'Previous Trouble/Quickfix Item',
    },
    {
      ']q',
      function()
        if require('trouble').is_open() then
          require('trouble').next { skip_groups = true, jump = true }
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = 'Next Trouble/Quickfix Item',
    },
  },
}
