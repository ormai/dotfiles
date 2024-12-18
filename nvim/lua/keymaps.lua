function keymap(lhs, rhs, opts, mode)
  opts = type(opts) == 'string' and { desc = opts }
      or vim.tbl_extend('error', opts --[[@as table]], { buffer = bufnr })
  mode = mode or 'n'
  vim.keymap.set(mode, lhs, rhs, opts)
end

keymap('<C-s>', '<cmd>set invspell<cr>', 'Toggle spell checking')
keymap('<A-k>', '<cmd>move .-2<cr>==', 'Move line up')
keymap('<A-j>', '<cmd>move .+1<cr>==', 'Move line down')
keymap('<A-k>', ":m '<-2<cr>gv-gv", { silent = true, desc = 'Move line or selection up' }, 'x')
keymap('<A-j>', ":m '>+1<cr>gv-gv", { silent = true, desc = 'Move line or selection down' }, 'x')

-- Don't lose selection when indenting in visual mode
keymap('<', '<gv', 'De-indent line or selection', 'v')
keymap('>', '>gv', 'Indent line or selection', 'v')

keymap('[d', vim.diagnostic.goto_prev, 'Previous diagnostic message')
keymap(']d', vim.diagnostic.goto_next, 'Next diagnostic mesage')
keymap('<Space>e', vim.diagnostic.open_float, 'Show diagnostic message')
keymap('<Space>q', vim.diagnostic.setloclist, 'Open diagnostics quickfix list')

keymap('dd', function()
    local line_data = vim.api.nvim_win_get_cursor(0)
    local current_line = vim.api.nvim_buf_get_lines(0, line_data[1] - 1,
      line_data[1], false)
    if current_line[1] == '' then
      return '"_dd'
    else
      return 'dd'
    end
  end,
  { noremap = true, expr = true, desc = "dd on empty line doesn't overwrite clibboard" });

keymap('<Space>l', function()
  local word_under_cursor = vim.fn.escape(vim.fn.expand('<cword>'), [[\/]])
  vim.system({
    'xdg-open',
    'https://en.wiktionary.org/wiki/' .. word_under_cursor
  })
end, 'Lookup word under cursor on the Wiktionary.')
