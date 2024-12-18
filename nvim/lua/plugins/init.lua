return {
  {
    'eandrju/cellular-automaton.nvim',
    cmd = 'CellularAutomaton',
  },
  {
    'windwp/nvim-autopairs',
    enabled = false,
    event = 'InsertEnter',
    dependencies = { 'hrsh7th/nvim-cmp' },
    config = function()
      require 'nvim-autopairs'.setup {}
      require 'cmp'.event:on('confirm_done',
        require 'nvim-autopairs.completion.cmp'.on_confirm_done())
    end,
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
  }
}
