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
    'Pocco81/auto-save.nvim',
    config = true,
  }
}
