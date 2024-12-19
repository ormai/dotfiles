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
    local telescope = require('telescope')
    telescope.setup {
      extensions = {
        ['ui-select'] = {
          require 'telescope.themes'.get_dropdown(),
        },
      },
    }
    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')

    local b = require 'telescope.builtin'
    Keymap('<Space>h', b.help_tags, 'Help tags')
    Keymap('<Space><Space>', b.find_files, 'Project files')
    Keymap('<Space>t', b.builtin, 'Telescope')
    Keymap('<Space>sw', b.grep_string, 'Search current word')
    Keymap('<Space>s', b.live_grep, 'Search everywhere')
    Keymap('<Space>rs', b.resume, 'Resume search')
    Keymap('<Space>p', b.diagnostics, 'Problems')
    Keymap('<Space>rf', b.oldfiles, 'Recent files')
    Keymap('<Space>k', b.keymaps, 'Keymaps')
    Keymap('<Space><tab>', b.buffers, 'Buffers')
    Keymap('<Space>/', b.current_buffer_fuzzy_find, 'Fuzzy search')
  end
}
