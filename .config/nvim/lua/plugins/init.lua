return {
  -- "tpope/vim-fugitive",
  -- "tpope/vim-sleuth",
  -- "tpope/vim-rhubarb",
  {
    "folke/neodev.nvim",
    lazy = true,
    ft = "lua",
    opts = {}
  },
  {
    "folke/twilight.nvim",
    enabled = false,
    opts = {}
  },
  {
    "fladson/vim-kitty", -- provides syntax highlighting for kitty.conf
    ft = "kitty",
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown"
  },
  {
    "romainl/vim-cool"
  }
}
