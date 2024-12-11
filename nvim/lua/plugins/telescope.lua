return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'nvim-telescope/telescope-ui-select.nvim',
    'nvim-tree/nvim-web-devicons'
  },
  keys = {
    '<leader>th', '<leader>tk', '<leader>tf', '<leader>tt', '<leader>tw',
    '<leader>tg', '<leader>td', '<leader>tr', '<leader>to', '<leader>tb',
    '<leader>t/'
  },
  config = function()
    require 'telescope'.setup {
      extensions = {
        ['ui-select'] = {
          require 'telescope.themes'.get_dropdown(),
        },
      },
    }
    require 'telescope'.load_extension 'fzf'
    require 'telescope'.load_extension 'ui-select'

    local keymap = function(key, action, desc)
      vim.keymap.set('n', '<leader>' .. key, action, { desc = desc })
    end
    local builtin = require 'telescope.builtin'
    keymap('h', builtin.help_tags, 'Help tags')
    keymap('<leader>', builtin.find_files, 'Project files')
    keymap('t', builtin.builtin, 'Telescope')
    keymap('sw', builtin.grep_string, 'Search current word')
    keymap('s', builtin.live_grep, 'Search everywhere')
    keymap('rs', builtin.resume, 'Resume search')
    keymap('p', builtin.diagnostics, 'Problems')
    keymap('rf', builtin.oldfiles, 'Recent files')
    keymap('k', builtin.keymaps, 'Keymaps')
    keymap('<tab>', builtin.buffers, 'Buffers')
    keymap('/', builtin.current_buffer_fuzzy_find, 'Fuzzy search')
  end
}
