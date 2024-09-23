return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = { -- https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'saadparwaiz1/cmp_luasnip',
    {
      'L3MON4D3/LuaSnip',
      lazy = true,
      dependencies = 'rafamadriz/friendly-snippets',
      version = '1.*',                 -- follow latest release.
      build = 'make install_jsregexp', -- install jsregexp (optional!).
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
  config = function()
    local icons = {
      Text = '',
      Method = '󰆧',
      Function = '󰊕',
      Constructor = '',
      Field = '󰇽',
      Variable = '󰂡',
      Class = '󰠱',
      Interface = '',
      Module = '',
      Property = '󰜢',
      Unit = '',
      Value = '󰎠',
      Enum = '',
      Keyword = '󰌋',
      Snippet = '',
      Color = '󰏘',
      File = '󰈙',
      Reference = '',
      Folder = '󰉋',
      EnumMember = '',
      Constant = '󰏿',
      Struct = '',
      Event = '',
      Operator = '󰆕',
      TypeParameter = '󰅲'
    }
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    cmp.setup {
      enabled = function()
        local disabled = false
        disabled = disabled or
            (vim.api.nvim_get_option_value('buftype', { buf = 0 }) == 'prompt')
        disabled = disabled or (vim.fn.reg_recording() ~= '')
        disabled = disabled or (vim.fn.reg_executing() ~= '')
        return not disabled
      end,

      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end
      },

      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<C-e>'] = cmp.mapping { i = cmp.mapping.abort() },
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' }
      },
      formatting = {
        expandable_indicator = true,
        fields = { 'kind', 'abbr', 'menu', }, -- move kind on the left
        format = function(_, vim_item)
          -- Insert the icon just before the item kind
          -- vimItem.kind = string.format('%s  %s', icons[vimItem.kind],
          --   vimItem.kind)
          vim_item.kind = string.format('%s ', icons[vim_item.kind]) -- testing: keep only icon
          return vim_item;
        end
      },
      view = { docs = { auto_open = true } }
    }

    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({ { name = 'path' } },
        { {
          name = 'cmdline',
          option = { ignore_cmds = { 'Man', '!' } }
        } })
    })

    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = { { name = 'buffer' } }
    })
  end,
}
