function Keymap(lhs, rhs, opts, mode)
  opts = type(opts) == 'string' and { desc = opts }
      or vim.tbl_extend('error', opts --[[@as table]], { buffer = bufnr })
  mode = mode or 'n'
  vim.keymap.set(mode, lhs, rhs, opts)
end

--require 'scratch-terminal'

Keymap('<C-s>', '<cmd>set invspell<cr>', 'Toggle spell checking')
Keymap('<A-k>', '<cmd>move .-2<cr>==', 'Move line up')
Keymap('<A-j>', '<cmd>move .+1<cr>==', 'Move line down')
Keymap('<A-k>', ":m '<-2<cr>gv-gv",
  { silent = true, desc = 'Move line or selection up' }, 'x')
Keymap('<A-j>', ":m '>+1<cr>gv-gv",
  { silent = true, desc = 'Move line or selection down' }, 'x')

-- Don't lose selection when indenting in visual mode
Keymap('<', '<gv', 'De-indent line or selection', 'v')
Keymap('>', '>gv', 'Indent line or selection', 'v')

Keymap('[d', vim.diagnostic.goto_prev, 'Previous diagnostic message')
Keymap(']d', vim.diagnostic.goto_next, 'Next diagnostic mesage')
Keymap('<Space>e', vim.diagnostic.open_float, 'Show diagnostic message')
Keymap('<Space>q', vim.diagnostic.setloclist, 'Open diagnostics quickfix list')

Keymap('dd',
  function()
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
    desc = "dd on empty line doesn't overwrite clibboard"
  })

Keymap('<Space>l', function()
  local word_under_cursor = vim.fn.escape(vim.fn.expand('<cword>'), [[\/]])
  vim.system {
    'xdg-open',
    'https://en.wiktionary.org/wiki/' .. word_under_cursor
  }
end, 'Lookup word under cursor on the Wiktionary.')
