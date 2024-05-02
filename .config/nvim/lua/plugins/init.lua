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
      require('nvim-autopairs').setup {}
      require 'cmp'.event:on('confirm_done',
        require 'nvim-autopairs.completion.cmp'.on_confirm_done())
    end,
  },
  {
    'stevearc/oil.nvim',
    lazy = false,
    keys = { { '<leader>o', '<cmd>Oil<cr>', desc = 'Launch Oil' } },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      delete_to_trash = true
    }
  },
  {
    'akinsho/toggleterm.nvim',
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
  }
}
