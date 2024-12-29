local luasnip = require 'luasnip'
return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = 'make install_jsregexp',
      version = 'v2.*',
      dependencies = 'rafamadriz/friendly-snippets',
      config = function()
        require 'luasnip.loaders.from_vscode'.lazy_load()
        require 'snippets'
        luasnip.config.set_config {
          history = true,
          updateevents = 'TextChanged,TextChangedI',
          enable_autosnippets = true,
        }
      end
    },
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = { { path = '${3rd}/luv/library', words = { 'vim%.uv' } } }
      }
    }
  },
  opts = {
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'normal',
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 500
      }
    },
    snippets = {
      expand = luasnip.lsp_expand,
      active = function(filter)
        if filter and filter.direction then
          return luasnip.jumpable(filter.direction)
        end
        return luasnip.in_snippet()
      end,
      jump = luasnip.jump
    },
    sources = {
      default = { 'lsp', 'path', 'luasnip', 'buffer', 'lazydev' },
      providers = {
        lazydev = {
          name = 'LazyDev',
          module = 'lazydev.integrations.blink',
          fallbacks = { 'lsp' }
        },
        buffer = { min_keyword_length = 2 }
      }
    },
    signature = { enabled = true } -- EXPERIMENTAL
  },
  opts_extend = { 'sources.default' }
}
