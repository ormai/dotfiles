return {
  -- 'tpope/vim-fugitive',
  -- 'tpope/vim-sleuth',
  -- 'tpope/vim-rhubarb',
  {
    'folke/neodev.nvim',
    enabled = false,
    lazy = true,
    ft = 'lua',
    opts = {}
  },
  {
    'fladson/vim-kitty', -- provides syntax highlighting for kitty.conf
    ft = 'kitty'
  },
  {
    'iamcco/markdown-preview.nvim',
    ft = 'markdown'
  },
  {
    'romainl/vim-cool'
  },
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = { execution_message = { enabled = false } },
  },
  {
    "folke/zen-mode.nvim",
    keys = { { '<leader>z', '<cmd>ZenMode<cr>', desc = "Toggle ZenMode" } },
    cmd = 'ZenMode',
    opts = {
      window = {
        options = {
          number = false,
          cursorline = false,
          list = false,
          signcolumn = "no"
        }
      },
      plugins = {
        options = {
          enabled = true,
          laststatus = 0,
          showcmd = false,
          ruler = false
        }
      }
    }
  }
}
