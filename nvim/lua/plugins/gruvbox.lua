return {
  'ellisonleao/gruvbox.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require 'gruvbox'.setup {
      transparent_mode = false,
      contrast = '', -- 'hard'/'soft'/''
      italic = {
        strings = false,
        emphasis = true,
        comments = false,
        operators = false,
        folds = true,
      },
      overrides = {
        CursorLineNr = { bg = '', bold = true }, -- Remove bg in line number
        SignColumn = { link = 'Normal' },        -- Normal bg
        StatusLine = { link = 'Normal' },        -- transparent bg for '' and ''
        ZenBg = { link = 'Normal' },

        -- Remove lighter background from diagnostic signs
        DiagnosticSignError = { link = 'GruvboxRed' },
        DiagnosticSignInfo = { link = 'GruvboxBlue' },
        DiagnosticSignWarn = { link = 'GruvboxYellow' },
        DiagnosticSignHint = { link = 'GruvboxAqua' },

        LspReferenceWrite = { link = 'CursorLine' },
        LspReferenceText = { link = 'CursorLine' },
        LspReferenceRead = { link = 'CursorLine' },
      }
    }
    vim.cmd.colorscheme 'gruvbox'
  end
}
