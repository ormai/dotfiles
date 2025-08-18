return {
  {
    'eandrju/cellular-automaton.nvim',
    cmd = 'CellularAutomaton',
  },
  {
    'norcalli/nvim-colorizer.lua',
    ft = { 'css', 'scss', 'html', 'rasi' },
    cmd = { 'ColorizerAttachToBuffer', 'ColorizerToggle' },
    config = function(self)
      require('colorizer').setup(self.ft)
    end
  },
  { "OXY2DEV/ui.nvim" },
}
