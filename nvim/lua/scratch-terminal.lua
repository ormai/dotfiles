-- https://youtu.be/5PIiKDES_wc

local self = { win = -1, buf = -1 }

local function config()
  local c = {
    relative = 'editor',
    style = 'minimal',
    width = math.floor(vim.o.columns * (vim.o.columns < 150 and 0.9 or 0.7)),
    height = math.floor(vim.o.lines * 0.8),
    border = 'solid',
  }
  c.col = (vim.o.columns - c.width - 2) / 2
  c.row = (vim.o.lines - c.height - 2) / 2
  return c
end

vim.api.nvim_create_autocmd('VimResized', {
  group = vim.api.nvim_create_augroup('scratch-terminal', { clear = true }),
  callback = function()
    if vim.api.nvim_win_is_valid(self.win) then
      vim.api.nvim_win_set_config(self.win, config())
    end
  end
})

Keymap('<C-BS>', function()
  if not vim.api.nvim_win_is_valid(self.win) then
    if not vim.api.nvim_buf_is_valid(self.buf) then
      self.buf = vim.api.nvim_create_buf(false, true)
    end
    self.win = vim.api.nvim_open_win(self.buf, true, config())
    if vim.bo[self.buf].buftype ~= 'terminal' then
      vim.cmd.terminal()
    end
  else
    vim.api.nvim_win_hide(self.win)
  end
end, 'Toggle scratch terminal', { 'n', 't', 'i', 'x' })
