return {
  enabled = false,
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = "MunifTanjim/nui.nvim",
  opts = {
    cmdline = {
      view = "cmdline_popup",
      format = {
        cmdline = {
          title = '',
          icon = ':',
          icon_hl_group = 'Normal'
        },
        filter = {
          title = ''
        },
        lua = {
          title = '',
          icon_hl_group = 'DevIconLua'
        },
        help = {
          title = '',
          icon_hl_group = 'DevIconTxt',
          icon = '󰈙'
        },
        search_up = { title = '' },
        search_down = { title = '' }
      }
    },
    views = {
      mini = {
        timeout = 3000,
        win_options = {
          winblend = 0
        },
        position = { -- have some spacing
          row = -2,
          col = -1,
        }
      },
      cmdline_popup = {
        position = {
          row = '40%'
        }
      }
    },
    routes = {
      {
        view = "notify",
        filter = {
          event = "msg_showmode"
        }
      }
    },
    lsp = {
      override = { -- hover documentation uses markdown and Treesitter
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true
      }
    },
    presets = {
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = true
    }
  },
}
