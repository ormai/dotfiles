local options = {
  termguicolors = true,
  background = 'dark',
  laststatus = 3, -- global status line
  pumheight = 10, -- pop up menu height
  signcolumn = 'yes',
  showmode = false,
  cmdheight = 0,
  showcmdloc = 'statusline',
  history = 100,

  conceallevel = 0,
  list = true,
  listchars = 'eol:↴,space:⋅,lead: ,trail:-,tab:  ',
  number = true,
  relativenumber = false,
  cursorline = true,

  writebackup = true,
  backup = true,
  backupdir = '/home/mario/.local/state/nvim/backup',
  swapfile = true,
  undofile = true,
  updatetime = 250,          -- (ms) time to save swap file

  clipboard = 'unnamedplus', -- share system clipboard
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

  spell = true,
  spelllang = { 'it', 'en' },
}

vim.g.loaded_perl_provider = 0

for k, v in pairs(options) do
  vim.opt[k] = v
end
