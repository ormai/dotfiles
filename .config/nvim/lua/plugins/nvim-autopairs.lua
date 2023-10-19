return {
  'windwp/nvim-autopairs',
  event = { 'BufReadPost', 'BufNewFile' },
  config = function()
    require('nvim-autopairs').setup {}
  end
}
