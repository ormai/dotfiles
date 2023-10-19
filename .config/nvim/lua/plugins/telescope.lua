return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    { 'nvim-lua/plenary.nvim',                    lazy = true },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', },
  },

  keys = {
    {
      '<leader>p',
      '<cmd>Telescope<CR>',
      desc = 'Telescope'
    },
    {
      '<leader>w',
      function() require('telescope.builtin').grep_string() end,
      desc = 'Telescope: search current word'
    },
    {
      '<leader>g',
      function() require('telescope.builtin').live_grep() end,
      desc = 'Telescope: live grep'
    },
    {
      '<leader>/',
      function() require('telescope.builtin').current_buffer_fuzzy_find() end,
      desc = 'Telescope: fuzzy find in buffer'
    },
    {
      '<leader><tab>',
      function() require('telescope.builtin').buffers() end,
      desc = 'Telescope: buffers'
    },
    {
      '<leader><space>',
      function() require('telescope.builtin').find_files() end,
      desc = 'Telescope: files'
    },
    {
      '<leader>o',
      function() require('telescope.builtin').oldfiles() end,
      desc = 'Telescope: old files'
    },
    {
      '<leader>d',
      function() require('telescope.builtin').diagnostics() end,
      desc = 'Telescope: diagnostics'
    },
    {
      '<leader>h',
      function() require('telescope.builtin').help_tags() end,
      desc = 'Telescope: help'
    },
    {
      '<leader>m',
      function() require('telescope.builtin').man_pages() end,
      desc = 'Telescope: man pages'
    },
    {
      '<leader>k',
      function() require('telescope.builtin').keymaps() end,
      desc = 'Telescope: keymaps'
    },
  },

  config = function(plugin)
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    }

    pcall(require('telescope').load_extension, 'fzf') -- enable fzf-native
  end
}
