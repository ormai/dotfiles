vim.fn.sign_define('DapLogPoint', { text = '' })
vim.fn.sign_define('DapBreakpoint', { text = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '' })
vim.fn.sign_define('DapStopped', { text = '' })

return {
  'mfussenegger/nvim-dap',
  keys = {
    '<F5>', '<F10>', '<F11>', '<F12>', '<Space>br', '<Space>lp',
    '<Space>dr', '<Space>dl', '<Space>dh', '<Space>dp', '<Space>df',
    '<Space>ds'
  },
  config = function()
    local widgets = require('dap.ui.widgets')
    local dap = require('dap')

    Keymap('<F5>', dap.continue, 'DAP: continue')
    Keymap('<F10>', dap.step_over, 'DAP: step over')
    Keymap('<F11>', dap.step_into, 'DAP: step into')
    Keymap('<F12>', dap.step_out, 'DAP: step out')
    Keymap('<Space>b', dap.toggle_breakpoint, 'DAP: toggle breakpoint')
    Keymap('<Space>lp', function()
      dap.set_breakpoint(nil, nil, vim.fn.input('Log: '))
    end, 'DAP: set breakpoint with log')
    Keymap('<Space>dr', dap.repl.open, 'DAP: open REPL/debug console')
    Keymap('<Space>dl', dap.run_last, 'DAP: re-run last debug adapter')
    Keymap('<Space>dh', widgets.hover,
      'DAP: evaluate and show expression under cursor', { 'n', 'v' })
    Keymap('<Space>dp', widgets.preview,
      'DAP: evaluate and preview of expression under cursor', { 'n', 'v' })
    -- Keymap('<Space>df', widgets.centered_float(widgets.frames),
    --   'DAP: show stack frames')
    -- Keymap('<Space>ds', widgets.centered_float(widgets.scopes),
    --   'DAP: show variables in the current scopes')

    dap.adapters = {
      gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
      },
      python = {
        type = 'executable',
        command = 'debugpy'
      }
    }
    dap.configurations = {
      rust = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
              'file')
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
        {
          name = "Select and attach to process",
          type = "gdb",
          request = "attach",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
              'file')
          end,
          pid = function()
            local name = vim.fn.input('Executable name (filter): ')
            return require("dap.utils").pick_process({ filter = name })
          end,
          cwd = '${workspaceFolder}'
        },
        {
          name = 'Attach to gdbserver :1234',
          type = 'gdb',
          request = 'attach',
          target = 'localhost:1234',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
              'file')
          end,
          cwd = '${workspaceFolder}'
        }
      },
      cpp = {
        {
          name = "Launch file",
          type = "cppdbg",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
              'file')
          end,
          cwd = '${workspaceFolder}',
          stopAtEntry = true,
        },
        {
          name = 'Attach to gdbserver :1234',
          type = 'cppdbg',
          request = 'launch',
          MIMode = 'gdb',
          miDebuggerServerAddress = 'localhost:1234',
          miDebuggerPath = '/usr/bin/gdb',
          cwd = '${workspaceFolder}',
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/',
              'file')
          end
        }
      }
    }
  end
}
