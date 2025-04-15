return {
  'MagicDuck/grug-far.nvim',
  opts = { headerMaxWidth = 80 },
  cmd = 'GrugFar',
  keys = {
    {
      '<leader>rr',
      function()
        local grug = require 'grug-far'
        local ext = vim.bo.buftype == '' and vim.fn.expand '%:e'
        grug.open {
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= '' and '*.' .. ext or nil,
          },
          keymaps = {
            replace = { n = '<localleader>r' },
            qflist = { n = '<localleader>q' },
            syncLocations = { n = '<localleader>s' },
            syncLine = { n = '<localleader>l' },
            close = { n = 'q' },
            historyOpen = { n = '<localleader>t' },
            historyAdd = { n = '<localleader>a' },
            refresh = { n = '<localleader>f' },
            openLocation = { n = '<localleader>o' },
            openNextLocation = { n = '<down>' },
            openPrevLocation = { n = '<up>' },
            gotoLocation = { n = '<enter>' },
            pickHistoryEntry = { n = '<enter>' },
            abort = { n = '<localleader>b' },
            help = { n = '?' },
            toggleShowCommand = { n = '<localleader>p' },
            swapEngine = { n = '<localleader>e' },
            previewLocation = { n = '<localleader>i' },
            swapReplacementInterpreter = { n = '<localleader>x' },
            applyNext = { n = '<localleader>j' },
            applyPrev = { n = '<localleader>k' },
          },
        }
      end,
      mode = { 'n', 'v' },
      desc = 'Search and [R]eplace',
    },
  },
}
