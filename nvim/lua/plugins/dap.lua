return {
  'mfussenegger/nvim-dap',
  keys = {
    '<F5>', '<F10>', '<F11>', '<F12>', '<leader>b', '<Leader>B', '<Leader>lp',
    '<Leader>dr', '<Leader>dl', '<Leader>dh', '<Leader>dp', '<Leader>df',
    '<Leader>ds'
  },
  config = function()
    local widgets = require 'dap.ui.widgets'
    local dap = require 'dap'

    keymap('<F5>', dap.continue, 'DAP: continue')
    keymap('<F10>', dap.step_over, 'DAP: step over')
    keymap('<F11>', dap.step_into, 'DAP: step into')
    keymap('<F12>', dap.step_out, 'DAP: step out')
    keymap('<Space>b', dap.toggle_breakpoint, 'DAP: toggle breakpoint')
    keymap('<Space>B', dap.set_breakpoint, 'DAP: step breakpoint')
    keymap('<Space>lp', function()
      dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
    end, 'DAP: set breakpoint with log')
    keymap('<Space>dr', dap.repl.open, 'DAP: open REPL/debug console')
    keymap('<Space>dl', dap.run_last, 'DAP: re-run last debug adapter')
    keymap('<Space>dh', widgets.hover, 'DAP: evaluate and show expression under cursor', { 'n', 'v' })
    keymap('<Space>dp', widgets.preview, 'DAP: evaluate and show preview of expression under cursor', { 'n', 'v' })
    keymap('<Space>df', widgets.centered_float(widgets.frames), 'DAP: show stack frames')
    keymap('<Space>ds', widgets.centered_float(widgets.scopes), 'DAP: show variables in the current scopes')

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
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end
        }
      }
    }
  end
}
