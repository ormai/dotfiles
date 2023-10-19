return {
  'kylechui/nvim-surround',
  version = '*',
  event = 'InsertEnter',
  config = function()
    require('nvim-surround').setup({})
  end
}
