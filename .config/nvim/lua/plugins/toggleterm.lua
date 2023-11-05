return {
  'akinsho/toggleterm.nvim',
  cmd = { 'ToggleTerm', 'TermExec' },
  keys = {
    {
      '<C-t>',
      '<cmd>ToggleTerm<cr>',
      { desc = 'ToggleTerm' }
    }
  },
  opts = { size = 20 }
}
