return {
  'mfussenegger/nvim-dap',
  keys = {
    { '<F5>',       function() require('dap').continue() end },
    { '<F10>',      function() require('dap').step_over() end },
    { '<F11>',      function() require('dap').step_into() end },
    { '<F12>',      function() require('dap').step_out() end },
    { '<leader>b',  function() require('dap').toggle_breakpoint() end },
    { '<Leader>B',  function() require('dap').set_breakpoint() end },
    { '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end },
    { '<Leader>dr', function() require('dap').repl.open() end },
    { '<Leader>dl', function() require('dap').run_last() end },
    {
      '<Leader>dh',
      function()
        require('dap.ui.widgets').hover()
      end,
      mode = { 'n', 'v' },
    },
    {
      '<Leader>dp',
      function()
        require('dap.ui.widgets').preview()
      end,
      mode = { 'n', 'v' },
    },
    {
      '<Leader>df',
      function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.frames)
      end
    },
    { '<Leader>ds',
      function()
        local widgets = require('dap.ui.widgets')
        widgets.centered_float(widgets.scopes)
      end
    }
  },
  config = function()
    local dap = require('dap');

    dap.adapters.cppdbg = {
      id = 'cppdbg',
      type = 'executable',
      command = '/home/mario/.local/share/nvim/mason/bin/OpenDebugAD7',
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
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
        end,
      },
    }
  end
}
