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
  -- default config
  {
    'iamcco/markdown-preview.nvim', -- markdown preview plugin for (neo)vim
    ft = 'markdown'
  },
}
