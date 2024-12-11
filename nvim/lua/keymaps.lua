vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.keymap.set('n', '<C-s>', '<cmd>set invspell<cr>',
--   { desc = 'Toggle spell checking' })
--
vim.keymap.set('n', '<A-k>', '<cmd>move .-2<cr>==', { desc = 'Move line up' })
vim.keymap.set('n', '<A-j>', '<cmd>move .+1<cr>==', { desc = 'Move line down' })
vim.keymap.set('x', '<A-k>', ":m '<-2<cr>gv-gv",
  { silent = true, desc = 'Move line or selection up' })
vim.keymap.set('x', '<A-j>', ":m '>+1<cr>gv-gv",
  { silent = true, desc = 'Move line or selection down' })

-- Don't lose selection when indenting in visual mode
vim.keymap.set('v', '<', '<gv', { desc = 'De-indent line or selection' })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent line or selection' })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev,
  { desc = 'Previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next,
  { desc = 'Next diagnostic mesage' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float,
  { desc = 'Show diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist,
  { desc = 'Open diagnostics quickfix list' })

vim.keymap.set('n', 'dd', function()
    local line_data = vim.api.nvim_win_get_cursor(0)
    local current_line = vim.api.nvim_buf_get_lines(0, line_data[1] - 1,
      line_data[1], false)
    if current_line[1] == '' then
      return '"_dd'
    else
      return 'dd'
    end
  end,
  {
    noremap = true,
    expr = true,
    desc =
    "dd on empty line doesn't overwrite clibboard"
  });

vim.keymap.set('n', '<leader>l', function()
  local word_under_cursor = vim.fn.escape(vim.fn.expand('<cword>'), [[\/]])
  vim.system({
    'xdg-open',
    'https://en.wiktionary.org/wiki/' .. word_under_cursor
  })
end, { desc = 'Lookup word under cursor on the Wiktionary.' })

-- Toggle term
-- function _G.set_terminal_ks()
--   local opts = { buffer = 0 }
--   vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--   vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--   vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--   vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--   vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--   vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
--   vim.keymap.set('t', '<C-t>', [[<Cmd>ToggleTerm<CR>]], opts)
-- end
--
-- vim.cmd.autocmd({ 'TermOpen', 'term://*', 'lua', 'set_terminal_ks()' })
