return {
  {
    'eandrju/cellular-automaton.nvim',
    cmd = 'CellularAutomaton',
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require 'nvim-autopairs'.setup {}
      require 'cmp'.event:on('confirm_done',
        require 'nvim-autopairs.completion.cmp'.on_confirm_done())
    end,
  },
  {
    'stevearc/oil.nvim',
    enabled = false,
    lazy = false,
    keys = { { '<leader>o', '<cmd>Oil<cr>', desc = 'Launch Oil' } },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      delete_to_trash = true,
    }
  },
  {
    'akinsho/toggleterm.nvim',
    enabled = false,
    cmd = { 'ToggleTerm', 'TermExec' },
    keys = {
      { '<C-t>', '<cmd>ToggleTerm<cr>', { desc = 'ToggleTerm' } }
    },
    opts = { size = 20 }
  },
  {
    'norcalli/nvim-colorizer.lua',
    ft = { 'css', 'scss', 'html', 'rasi' },
    cmd = { 'ColorizerAttachToBuffer', 'ColorizerToggle' },
    config = function(self)
      require('colorizer').setup(self.ft)
    end
  },
  {
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "luvit-meta/library", words = { "vim%.uv" } },
        },
      },
    },

    { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
    {                                        -- optional completion source for require statements and module annotations
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        opts.sources = opts.sources or {}
        table.insert(opts.sources, {
          name = "lazydev",
          group_index = 0, -- set group index to 0 to skip loading LuaLS completions
        })
      end,
    },
    -- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
  },
  {
    "OXY2DEV/markview.nvim",
    enabled = false,
    lazy = false, -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
      -- You will not need this if you installed the
      -- parsers manually
      -- Or if the parsers are in your $RUNTIMEPATH
      "nvim-treesitter/nvim-treesitter",

      "nvim-tree/nvim-web-devicons"
    }
  }
}
