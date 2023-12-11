return {
  {
    'Beastwick18/nabla.nvim',
    ft = { 'markdown', 'tex' },
    config = function()
      require('nabla').enable_virt({
        align_center = false
      })
    end
  },
  {
    'edluffy/hologram.nvim', -- A cross platform terminal image viewer for Neovim.
    enabled = false,
    config = function()
      require('hologram').setup {
        auto_display = true -- WIP automatic markdown image display, may be prone to breaking
      }
    end
  },
  {
    'iamcco/markdown-preview.nvim', -- markdown preview plugin for (neo)vim
    ft = 'markdown'
  },
}
