return {
  --[[ {
    'tpope/vim-fugitive', -- A Git wrapper so awesome, it should be illegal
    cmd = {
      'G', 'Git', 'Ggrep', 'Glrep', 'Gclog', 'Gcd', 'Glcd', 'Gedit', 'Gsplit',
      'Gvsplit', 'Gtabedit', 'Gpedit', 'Gdrop', 'Gread', 'Gwrite', 'Gdiffsplit',
      'Gvdiffsplit', 'Ghdiffsplit', 'GMove', 'Gremove', 'GUnlink', 'GBrowser'
    }
  }, ]]
  -- 'tpope/vim-rhubarb', -- GitHub extension for fugitive.vim
  -- 'tpope/vim-sleuth',  -- Heuristically set buffer options
  'romainl/vim-cool',    -- A very simple plugin that makes hlsearch more useful.
  {
    'folke/neodev.nvim', -- Neovim setup for init.lua and plugin development...
    ft = 'lua',
    opts = {}
  },
  {
    'fladson/vim-kitty', -- Vim syntax highlighting for Kitty terminal config
    ft = 'kitty'
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}
  },
  {
    'iamcco/markdown-preview.nvim', -- markdown preview plugin for (neo)vim
    ft = 'markdown'
  },
  {
    'okuuva/auto-save.nvim', -- Automatically save your changes in NeoVim
    cmd = 'ASToggle',
    event = { 'InsertLeave', 'TextChanged' },
    opts = {
      execution_message = {
        enabled = false
      }
    }
  },
  {
    'Beastwick18/nabla.nvim', -- tmp
    ft = { 'markdown', 'tex' },
    config = function()
      require('nabla').enable_virt({
        align_center = false
      });
    end
  },
}
