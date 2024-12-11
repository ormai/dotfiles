for k, v in pairs {
  title = true,
  titlestring = '%{v:progname} %f %h',
  guifont = 'JetBrainsMono Nerd Font:h12',
  termguicolors = true,
  clipboard = 'unnamedplus',
  fileencoding = 'utf-8',
  mouse = 'a',
  spelllang = { 'en', 'it' },
  wrap = false,
  shell = '/usr/bin/fish',

  laststatus = 3,
  cmdheight = 0,
  showcmdloc = 'statusline',
  showmode = false,

  pumheight = 8,
  completeopt = { 'menu', 'menuone', 'noinsert', 'preview' },

  list = true,
  listchars = { trail = '-', tab = '  ' },
  fillchars = { eob = ' ', foldopen = '⌄', foldsep = '│', foldclose = '›' },
  conceallevel = 2,

  signcolumn = 'yes',
  number = true,
  -- relativenumber = true,
  cursorline = true,
  cursorlineopt = 'number',

  history = 1000,
  backup = true,
  backupdir = vim.fn.stdpath('state') .. 'backup/',
  undofile = true,
  updatetime = 200,

  ignorecase = true,
  smartcase = true,

  smartindent = true,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,

  splitbelow = true,
  splitright = true,

  foldcolumn = 'auto:9',
  foldlevel = 99,
  foldlevelstart = 99,
  foldenable = true
} do
  vim.opt[k] = v
end

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
