return {
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    opts = {
      contrast = 'hard',
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
  },
  {
    'wtfox/jellybeans.nvim',
    enabled = false,
    priority = 1000,
    lazy = false,
    opts = {
      flat_ui = false,
      transparent = false,
      palette = 'jellybeans_muted'
    },
    config = function(_, opts)
      require('lualine').setup {
        options = { theme = 'jellybeans' }
      }
      require('jellybeans').setup(opts)
    end
  },
  {
    'projekt0n/github-nvim-theme',
    enabled = false
  },
  {
    "rebelot/kanagawa.nvim"
  }
}
