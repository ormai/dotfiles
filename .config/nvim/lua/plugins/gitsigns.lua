return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  dependencies = 'nvim-lua/plenary.nvim',
  config = {
    signs = {
      untracked = { text = '' },
    },
    max_file_length = 2000
  }
}
