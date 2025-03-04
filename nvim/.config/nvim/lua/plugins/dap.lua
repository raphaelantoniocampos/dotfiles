return {
  {
    'mfussenegger/nvim-dap',
  },
  { 'mfussenegger/nvim-dap-python' },
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    dependencies = { 'jay-babu/mason-nvim-dap.nvim', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      dapui.setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end

      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end

      -- dap.listeners.before.event_terminated.dapui_config = function()
      --   dapui.close()
      -- end
      -- dap.listeners.before.event_exited.dapui_config = function()
      --   dapui.close()
      -- end
      vim.keymap.set('n', '<leader>dq', dapui.close, { desc = 'Close DAP UI' })

      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>dr', dap.continue, { desc = 'Start or continue the debugger' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step into' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Step over' })
      vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'Step out' })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Terminate the debugger' })

      -- custom adapters

      -- python
      local function find_main_py(root_dir)
        local scan = require 'plenary.scandir'
        local results = scan.scan_dir(root_dir, {
          search_pattern = 'main.py',
          depth = 5,
          add_dirs = false,
        })
        if #results > 0 then
          return results[1]
        end
        return '${file}'
      end

      require('dap-python').setup 'uv'
      table.insert(require('dap').configurations.python, {
        type = 'python',
        request = 'launch',
        name = 'Launch main.py',
        program = find_main_py,
        cwd = '${workspaceFolder}',
      })
    end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    event = 'VeryLazy',
    dependencies = {
      'williamboman/mason.nvim',
      'mfussenegger/nvim-dap',
    },
    opts = {
      handlers = {},
    },
  },
}
