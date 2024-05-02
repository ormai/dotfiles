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

    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>th', builtin.help_tags,
      { desc = 'Telescope: help tags' })
    vim.keymap.set('n', '<leader>tk', builtin.keymaps,
      { desc = 'Telescope: keymaps' })
    vim.keymap.set('n', '<leader>tf', builtin.find_files,
      { desc = 'Telescope: files' })
    vim.keymap.set('n', '<leader>tt', builtin.builtin,
      { desc = 'Telescope: pickers' })
    vim.keymap.set('n', '<leader>tw', builtin.grep_string,
      { desc = 'Telescope: grep current word' })
    vim.keymap.set('n', '<leader>tg', builtin.live_grep,
      { desc = 'Telescope: grep across files' })
    vim.keymap.set('n', '<leader>td', builtin.diagnostics,
      { desc = 'Telescope: diagnostics' })
    vim.keymap.set('n', '<leader>tr', builtin.resume,
      { desc = 'Telescope: resume search' })
    vim.keymap.set('n', '<leader>to', builtin.oldfiles,
      { desc = 'Telescope: old files' })
    vim.keymap.set('n', '<leader>tb', builtin.buffers,
      { desc = 'Telescope: buffers' })
    vim.keymap.set('n', '<leader>t/', builtin.current_buffer_fuzzy_find,
      { desc = 'Telescope: fuzzy find in buffer' })
  end
}
