return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = 'nvim-lua/plenary.nvim',
  opts = {
    signs = {
      untracked = { text = '' },
    },
    max_file_length = 2000
  }
}
