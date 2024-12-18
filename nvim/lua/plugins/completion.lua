return {
  'saghen/blink.cmp',
  lazy = false,
  version = 'v0.*',
  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = 'make install_jsregexp',
      version = 'v2.*',
      dependencies = 'rafamadriz/friendly-snippets',
      config = function()
        require 'luasnip.loaders.from_vscode'.lazy_load()
        require 'snippets'
        require 'luasnip'.config.set_config {
          history = true, -- remember the last snippet
          updateevents = 'TextChanged,TextChangedI',
          enable_autosnippets = true,
        }
      end

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

        Field = '󰜢',
        Variable = '󰂡',
        Property = '󰜢',

        Class = '󱡠',
        Interface = '󱡠',
        Struct = '󱡠',
        Module = '',

        Unit = '',
        Value = '󰎠',
        Enum = '',
        EnumMember = '',

        Keyword = '󰌋',
        Constant = '󰏿',

        Snippet = '󱄽',
        Color = '󰏘',
        File = '󰈔',
        Reference = '',
        Folder = '󰉋',
        Event = '󱐋',
        Operator = '󰪚',
        TypeParameter = '󰠱',
      },
    },
    snippets = {
      expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
      active = function(filter)
        if filter and filter.direction then
          return require('luasnip').jumpable(filter.direction)
        end
        return require('luasnip').in_snippet()
      end,
      jump = function(direction) require('luasnip').jump(direction) end,
    },
    sources = {
      default = { 'lsp', 'path', 'luasnip', 'buffer' },
    },
    signature = { enabled = true } -- experimental signature help support
  },
  opts_extend = { "sources.default" }
}
