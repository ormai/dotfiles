for k, v in pairs {
  guifont = 'JetBrainsMono Nerd Font:h12',
  termguicolors = true, -- 24-bit RGB colors
  laststatus = 3,
  cmdheight = 0,
  showcmdloc = 'statusline',
  showmode = false,
  signcolumn = 'yes:2',
  pumheight = 12, -- max height of the pop up completion menu
  history = 100,
  conceallevel = 2,
  list = true,
  listchars = { trail = '-', tab = '  ' },
  fillchars = { eob = ' ', foldopen = '⌄', foldsep = '│', foldclose = '›' },
  number = true,
  relativenumber = true,
  cursorline = true,
  cursorlineopt = 'number',
  backup = true,
  backupdir = vim.fn.stdpath 'state' .. 'backup',
  undofile = true,
  updatetime = 200,
  clipboard = 'unnamedplus',
  completeopt = { 'menu', 'menuone', 'noinsert', 'preview' },
  fileencoding = 'utf-8',
  ignorecase = true,
  smartcase = true,
  mouse = 'a',
  smartindent = true,
  splitbelow = true, -- split below horizontally
  splitright = true, -- split on the left vertically
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  wrap = false,
  spelllang = { 'en', 'it' },

  foldcolumn = 'auto:9',
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true,

  title = true,
  titlestring = "%{v:progname} %f %h"
} do
  vim.opt[k] = v
end

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
-- vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
