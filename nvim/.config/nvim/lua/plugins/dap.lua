return {
  {
    'mfussenegger/nvim-dap',
  },
  { 'mfussenegger/nvim-dap-python' },
  {
    'rcarriga/nvim-dap-ui',
    event = 'VeryLazy',
    dependencies = { 'jay-babu/mason-nvim-dap.nvim', 'nvim-neotest/nvim-nio', 'theHamsta/nvim-dap-virtual-text' },
    config = function()
      local mason_dap = require 'mason-nvim-dap'
      local dap = require 'dap'
      local ui = require 'dapui'
      local dap_virtual_text = require 'nvim-dap-virtual-text'

      -- Dap Virtual Text
      dap_virtual_text.setup()

      mason_dap.setup {
        ensure_installed = { 'codelldb' },
        automatic_installation = true,
        handlers = {
          function(config)
            require('mason-nvim-dap').default_setup(config)
          end,
        },
      }

      -- Configurations
      dap.configurations = {
        c = {
          {
            name = 'Launch file',
            type = 'codelldb',
            request = 'launch',
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopAtEntry = false,
            MIMode = 'lldb',
          },
          {
            name = 'Attach to lldbserver :1234',
            type = 'codelldb',
            request = 'launch',
            MIMode = 'lldb',
            miDebuggerServerAddress = 'localhost:1234',
            miDebuggerPath = '/usr/bin/lldb',
            cwd = '${workspaceFolder}',
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
          },
        },
      }
      --
      --   -- custom adapters
      --
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

      -- Dap UI

      ui.setup()

      vim.fn.sign_define('DapBreakpoint', { text = '🐞' })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end

      vim.keymap.set('n', '<leader>dq', ui.close, { desc = 'Close DAP UI' })

      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle Breakpoint' })
      vim.keymap.set('n', '<leader>dr', dap.continue, { desc = 'Start or continue the debugger' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step into' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = 'Step over' })
      vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = 'Step out' })
      vim.keymap.set('n', '<leader>dt', dap.terminate, { desc = 'Terminate the debugger' })
    end,
  },
}
