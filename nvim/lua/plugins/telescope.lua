return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons'
  },
  keys = {
    '<Space>h', '<Space><Space>', '<Space>t', '<Space>sw', '<Space>s',
    '<Space>rs', '<Space>p', '<Space>rf', '<Space>k', '<Space><tab>',
    '<Space>/'
  },
  config = function()
    local telescope = require 'telescope'
    telescope.setup {
      extensions = {
        ['ui-select'] = {
          require 'telescope.themes'.get_dropdown(),
        },
        fzf = {}
      },
    }
    telescope.load_extension 'fzf'
    telescope.load_extension 'ui-select'

    local b = require 'telescope.builtin'
    Keymap('<Space>h', b.help_tags, 'Telescope: Help')
    Keymap('<space><space>', b.find_files, 'Telescope: Find Files')
    Keymap('<c-s-p>', b.builtin, 'Telescope')
    Keymap('<Space>sw', b.grep_string, 'Telescope: Find Word')
    Keymap('<Space>g', b.live_grep, 'Telescope: Live Grep')
    Keymap('<Space>rs', b.resume, 'Telescope: Resume Live Grep')
    Keymap('<Space>p', b.diagnostics, 'Telescope: Workspace Diagnostics')
    Keymap('<Space>rf', b.oldfiles, 'Telescope: Oldfiles')
    Keymap('<Space>k', b.keymaps, 'Telescope: Key Maps')
    Keymap('<Space><tab>', b.buffers, 'Telescope: Buffers')
    Keymap('<Space>/', b.current_buffer_fuzzy_find,
      'Telescope: Current Buffer Fuzzy')
  end
}
