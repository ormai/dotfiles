return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  opts = {
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
      StatusLine = { link = 'Normal' },        -- transparent bg for '' ''
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
  },
  config = function(_, opts)
    require('gruvbox').setup(opts)
    vim.cmd.colorscheme('gruvbox')
  end
}
