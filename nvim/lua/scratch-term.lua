-- https://youtu.be/5PIiKDES_wc

local scratch_term = { win = -1, buf = -1 }

keymap('<C-BS>', function()
  if not vim.api.nvim_win_is_valid(scratch_term.win) then
    if not vim.api.nvim_buf_is_valid(scratch_term.buf) then
      scratch_term.buf = vim.api.nvim_create_buf(false, true)
    end
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    scratch_term.win = vim.api.nvim_open_win(scratch_term.buf, true, {
      relative = 'editor',
      style = 'minimal',
      width = width,
      height = height,
      col = math.floor((vim.o.columns - width) / 2),
      row = math.floor((vim.o.lines - height) / 2),
      border = 'solid'
    })
    if vim.bo[scratch_term.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(scratch_term.win)
  end
end, 'Toggle scratch terminal', { 'n', 't' })
