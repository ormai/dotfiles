return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    local gruvbox = require 'gruvbox'
    gruvbox.setup {
      -- transparent_mode = true,
      contrast = '',                             -- 'hard'/'soft'/''
      overrides = {
        CursorLineNr = { bg = '', bold = true }, -- Remove bg in line number
        SignColumn = { link = 'Normal' },        -- Normal bg
        StatusLine = { link = 'Normal' }, -- transparent bg for '' and ''
        ZenBg = { link = 'Normal' },

        -- Remove lighter background from diagnostic signs
        DiagnosticSignError = { link = 'GruvboxRed' },
        DiagnosticSignInfo = { link = 'GruvboxBlue' },
        DiagnosticSignWarn = { link = 'GruvboxYellow' },
        DiagnosticSignHint = { link = 'GruvboxAqua' },

        LspReferenceWrite = { bg = gruvbox.palette.dark1 },
        LspReferenceText = { bg = gruvbox.palette.dark2 },
        LspReferenceRead = { bg = gruvbox.palette.dark2 },
      }
    }
    vim.cmd.colorscheme 'gruvbox'
  end
}
