local options = {
  backup = false,                             -- creates a backup file
  clipboard = 'unnamedplus',                  -- global clipboard
  cmdheight = 1,                              -- height of the command line
  completeopt = 'menuone,noselect',           -- better experience with cmp
  conceallevel = 0,                           -- so that `` is visible in markdown files
  fileencoding = 'utf-8',                     -- the encoding written to a file
  hlsearch = true,                            -- highlight while searching
  ignorecase = true,                          -- ignore case in search patterns
  smartcase = true,                           -- smart case
  mouse = 'a',                                -- enable mouse mode
  pumheight = 10,                             -- pop up menu height
  showmode = false,                           -- hide things like -- INSERT --
  smartindent = true,                         -- make indenting smarter again
  splitbelow = true,                          -- force all horizontal splits to go below current window
  splitright = true,                          -- force all vertical splits to go to the right of current window
  swapfile = false,                           -- creates a swapfile
  timeoutlen = 1000,                          -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                            -- save undo history
  updatetime = 250,                           -- faster completion (4000ms default)
  writebackup = false,                        -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                           -- convert tabs to spaces
  shiftwidth = 2,                             -- the number of spaces inserted for each indentation
  tabstop = 2,                                -- insert 2 spaces for a tab
  cursorline = true,                          -- highlight the current line
  number = true,                              -- set numbered lines
  relativenumber = false,                     -- set relative numbered lines
  numberwidth = 2,                            -- set number column width to 2 {default 4}
  signcolumn = 'yes',                         -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                               -- nowrap
  scrolloff = 8,                              -- ?
  sidescrolloff = 8,
  colorcolumn = '80',                         -- An highlighted vertical bar at 80 colums from the left
  laststatus = 3,                             -- global statusline
  foldmethod = 'marker',                      -- Folds are created by markers, the default one is uded
  termguicolors = true,                       -- Enables 24-bit RGB color in the |TUI|.
  background = "dark",                        -- Dark and light mode switch
  list = true,
  listchars = "eol:↴,nbsp:+,space:⋅,trail:-", -- Reveal hidden character
  -- spell = true,
  -- spelllang = { "it", "en" },
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd("set iskeyword+=-")
