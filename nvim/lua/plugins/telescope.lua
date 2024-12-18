return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons'
  },
  keys = {
    '<Space>h', '<Space><Space>', '<Space>t', '<Space>sw', '<Space>s', '<Space>rs', '<Space>p',
    '<Space>rf', '<Space>k', '<Space><tab>', '<Space>/'
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
    keymap('<Space>h', b.help_tags, 'Help tags')
    keymap('<Space><Space>', b.find_files, 'Project files')
    keymap('<Space>t', b.builtin, 'Telescope')
    keymap('<Space>sw', b.grep_string, 'Search current word')
    keymap('<Space>s', b.live_grep, 'Search everywhere')
    keymap('<Space>rs', b.resume, 'Resume search')
    keymap('<Space>p', b.diagnostics, 'Problems')
    keymap('<Space>rf', b.oldfiles, 'Recent files')
    keymap('<Space>k', b.keymaps, 'Keymaps')
    keymap('<Space><tab>', b.buffers, 'Buffers')
    keymap('<Space>/', b.current_buffer_fuzzy_find, 'Fuzzy search')
  end
}
