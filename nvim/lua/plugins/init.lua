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
  {
    "EggbertFluffle/beepboop.nvim",
    enabled = false,
    opts = {
      audio_player = "ffplay",
      max_sounds = 20,
      sound_map = {
        { auto_command = 'VimEnter',      sound = 'Chest_open.ogg' },
        { auto_command = 'VimLeave',      sound = 'Chest_close1.ogg' },
        { auto_command = 'InsertCharPre', sound = 'Chicken_step2.ogg' }
      }
    }
  },
  {
    "j-hui/fidget.nvim",
    opts = {}
  },
  { "OXY2DEV/ui.nvim" }
}
