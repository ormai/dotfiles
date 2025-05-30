return {
  {
    'ellisonleao/gruvbox.nvim',
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
    priority = 1000,
    opts = {
      flat_ui = false,
      transparent = false,
    },
    config = function(_, opts)
      require('jellybeans').setup(opts)
      -- vim.cmd.colorscheme('jellybeans-muted')
      -- require('lualine').setup { options = { theme = 'jellybeans' } }
    end
  },
  { 'projekt0n/github-nvim-theme' },
  {
    'Mofiqul/vscode.nvim',
    config = function()
      -- require('lualine').setup { options = { theme = 'vscode' } }
    end
  },
  { 'mellow-theme/mellow.nvim' },
  { "catppuccin/nvim",            name = "catppuccin" }
}
