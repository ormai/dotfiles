local luasnip = require 'luasnip'
return {
  'saghen/blink.cmp',
  version = 'v0.*',
  enabled = false,
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
    -- {
    --   'zbirenbaum/copilot.lua',
    --   config = {
    --     suggestion = { enabled = false },
    --     panel = { enabled = false }
    --   }
    -- },
    -- 'giuxtaposition/blink-cmp-copilot',
    {
      'folke/lazydev.nvim',
      ft = 'lua',
      opts = {
        library = {
          { path = '${3rd}/luv/library', words = { 'vim%.uv' } }
        }
      }
    }
  },
  opts = {
    keymap = { preset = 'default' },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'normal',
      kind_icons = {
        Text = '',
        Method = '󰊕',
        Function = '󰊕',
        Constructor = '',
        Constant = '󰏿',
        Variable = '󰂡',
        Property = '󰜢',
        Field = '󰜢',
        Class = '󱡠',
        Interface = '󱡠',
        Struct = '󱡠',
        Module = '',
        Unit = '',
        Value = '󰎠',
        Enum = '',
        EnumMember = '',
        Keyword = '󰌋',
        Snippet = '󱄽',
        Color = '󰏘',
        Reference = '',
        File = '󰈔',
        Folder = '󰉋',
        Event = '󱐋',
        Operator = '󰪚',
        TypeParameter = '󰠱',
        -- Copilot = '',
      },
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
      default = { 'lsp', 'path', 'luasnip', 'buffer', --[['copilot',]] 'lazydev' },
      providers = {
        -- copilot = {
        --   name = 'copilot',
        --   module = 'blink-cmp-copilot',
        --   score_offset = 100,
        --   async = true
        -- },
        lsp = { fallback_for = { 'lazydev' } },
        lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink' }
      }
    },
    signature = { enabled = true } -- experimental signature help support
  },
  opts_extend = { 'sources.default' }
}
