return {
  'mfussenegger/nvim-dap',
  keys = {
    '<F5>', '<F10>', '<F11>', '<F12>', '<Space>b', '<Space>B', '<Space>lp',
    '<Space>dr', '<Space>dl', '<Space>dh', '<Space>dp', '<Space>df',
    '<Space>ds'
  },
  config = function()
    local widgets = require 'dap.ui.widgets'
    local dap = require 'dap'

    Keymap('<F5>', dap.continue, 'DAP: continue')
    Keymap('<F10>', dap.step_over, 'DAP: step over')
    Keymap('<F11>', dap.step_into, 'DAP: step into')
    Keymap('<F12>', dap.step_out, 'DAP: step out')
    Keymap('<Space>b', dap.toggle_breakpoint, 'DAP: toggle breakpoint')
    Keymap('<Space>B', dap.set_breakpoint, 'DAP: step breakpoint')
    Keymap('<Space>lp', function()
      dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
    end, 'DAP: set breakpoint with log')
    Keymap('<Space>dr', dap.repl.open, 'DAP: open REPL/debug console')
    Keymap('<Space>dl', dap.run_last, 'DAP: re-run last debug adapter')
    Keymap('<Space>dh', widgets.hover,
      'DAP: evaluate and show expression under cursor', { 'n', 'v' })
    Keymap('<Space>dp', widgets.preview,
      'DAP: evaluate and preview of expression under cursor', { 'n', 'v' })
    Keymap('<Space>df', widgets.centered_float(widgets.frames),
      'DAP: show stack frames')
    Keymap('<Space>ds', widgets.centered_float(widgets.scopes),
      'DAP: show variables in the current scopes')

    dap.adapters = {
      cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = '/home/mario/.local/share/nvim/mason/bin/OpenDebugAD7',
      },
      python = {
        type = 'executable',
        command = 'debugpy'
      }
    }
    dap.configurations = {
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
