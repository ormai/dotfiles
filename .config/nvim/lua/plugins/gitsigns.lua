return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = {
    signs = {
      add          = { text = '┃' },
      change       = { text = '┃' },
      delete       = { text = '▁' },
      topdelete    = { text = '▔' },
      changedelete = { text = '~' },
      untracked    = { text = '┃' },
    },
    numhl = true, -- line number highlight
    max_file_length = 10000
  }
}
