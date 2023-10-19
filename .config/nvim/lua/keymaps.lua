local k = vim.keymap.set -- Shorten function name

-- set the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
k('', '<Space>', '<Nop>') -- unbind <space> as it is the leader key

-- Move text up and down
k('n', '<A-j>', ':m .+1<CR>==', { silent = true, desc = 'Move line down' })
k('n', '<A-k>', ':m .-2<CR>==', { silent = true, desc = 'Move line up' })
k('x', '<A-j>', ":m '>+1<CR>gv-gv", { silent = true, desc = 'Move line down' })
k('x', '<A-k>', ":m '<-2<CR>gv-gv", { silent = true, desc = 'Move line up' })

-- Stay in indent mode
k('v', '<', '<gv', { silent = true, desc = '[<] Remove indent' })
k('v', '>', '>gv', { silent = true, desc = '[>] Add indent' })
-- Move text up and down

-- dd on an empty line doesn't overwire the clipboard
local function enhanced_dd()
  local line_data = vim.api.nvim_win_get_cursor(0)
  local current_line = vim.api.nvim_buf_get_lines(0, line_data[1] - 1,
    line_data[1], false)
  if current_line[1] == '' then
    return '"_dd'
  else
    return 'dd'
  end
end
k('n', 'dd', enhanced_dd, { noremap = true, expr = true });

function _G.set_terminal_ks()
  local opts = { buffer = 0 }
  k('t', '<esc>', [[<C-\><C-n>]], opts)
  k('t', 'jk', [[<C-\><C-n>]], opts)
  k('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  k('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  k('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  k('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  k('t', '<C-t>', [[<Cmd>ToggleTerm<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_ks()')
