local detail = false;

return {
  'stevearc/oil.nvim',
  lazy = false,
  opts = {
    delete_to_trash = true,
    columns = {},
    keymaps = {
      ['<C-h>'] = {
        desc = "Show hidden files and file details",
        callback = function()
          detail = not detail
          local oil = require('oil')
          oil.toggle_hidden()
          if detail then
            oil.set_columns({ "permissions", "size", "mtime" })
          else
            oil.set_columns({})
          end
        end,
      },
      ['<CR>'] = {
        desc = 'Open',
        callback = function()
          local oil = require('oil')
          oil.select()
          vim.cmd.cd(oil.get_current_dir());
        end
      }
    },
  },
}
