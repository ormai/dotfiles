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

    -- vim.keymap.set('n', '<F5>', dap.continue, { desc = 'DAP: continue' })
    vim.keymap.set('n', '<F10>', dap.step_over, { desc = 'DAP: step over' })
    -- vim.keymap.set('n', '<F11>', dap.step_into, { desc = 'DAP: step into' })
    vim.keymap.set('n', '<F12>', dap.step_out, { desc = 'DAP: step out' })
    vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint,
      { desc = 'DAP: toggle breakpoint' })
    vim.keymap.set('n', '<Leader>B', dap.set_breakpoint,
      { desc = 'DAP: step breakpoint' })
    vim.keymap.set('n', '<Leader>lp',
      function()
        dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
      end, { desc = 'DAP: set breakpoint with log' })
    vim.keymap.set('n', '<Leader>dr', dap.repl.open,
      { desc = 'DAP: open REPL/debug console' })
    vim.keymap.set('n', '<Leader>dl', dap.run_last,
      { desc = 'DAP: re-run last debug adapter' })
    vim.keymap.set({ 'n', 'v' }, '<Leader>dh',
      widgets.hover { desc = 'DAP: evaluate and show expression under cursor' })
    vim.keymap.set({ 'n', 'v' }, '<Leader>dp',
      widgets.preview { desc = 'DAP: evaluate and show preview of expression under cursor' })
    vim.keymap.set('n', '<Leader>df', widgets.centered_float(widgets.frames),
      { desc = 'DAP: show stack frames' })
    vim.keymap.set('n', '<Leader>ds', widgets.centered_float(widgets.scopes),
      { desc = 'DAP: show variables in the current scopes' })

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
