return {
  'akinsho/toggleterm.nvim',
  cmd = { 'ToggleTerm', 'TermExec' },
  keys = {
    {
      '<C-t>',
      '<cmd>ToggleTerm<cr>',
      { desc = 'ToggleTerm', silent = true }
    }
  },
  opts = { size = 20 }
}
