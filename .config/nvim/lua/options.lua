for k, v in pairs({
  termguicolors = true, -- 24-bit RGB colors
  background = 'dark',

  laststatus = 3, -- global status line
  cmdheight = 0,  -- hide the command line completely
  showcmdloc = 'statusline',
  showmode = false,

  signcolumn = 'yes:1',

  pumheight = 10, -- max height of the pop up completion menu
  history = 100,
  conceallevel = 2,
  list = true,
  --listchars = 'eol:↴,space:⋅,lead: ,trail:-,tab:  ',
  listchars = 'trail:-,tab:  ',
  fillchars = 'eob: ', -- hide ~
  number = true,
  cursorline = true,
  cursorlineopt = 'number', -- highlight only active line number

  writebackup = true,
  backup = true,
  backupdir = '/home/mario/.local/state/nvim/backup',
  swapfile = true,
  undofile = true,
  updatetime = 250, -- (ms) time to save swap file

  clipboard = 'unnamedplus',
  completeopt = 'menuone,noselect',
  fileencoding = 'utf-8',

  hlsearch = true,
  ignorecase = true,
  smartcase = true,

  mouse = 'a',
  smartindent = true,
  splitbelow = true, -- split below horizontally
  splitright = true, -- split on the left vertically

  timeoutlen = 1000, -- (ms) time to wait for next key press

  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  wrap = false,

  sidescrolloff = 2,

  foldmethod = 'marker',

  spell = false,
  spelllang = { 'en', 'it' },
}) do
  vim.opt[k] = v
end

vim.g.loaded_perl_provider = 0
vim.g.loaded_netrw         = 1
vim.g.loaded_netrwPlugin   = 1
