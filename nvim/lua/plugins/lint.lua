return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      markdown = { 'proselint' },
      text = { 'proselint' },
      make = { 'checkmake' },
      kotlin = { 'ktlint' }
    }

    vim.api.nvim_create_autocmd(
      { 'BufReadPost', 'BufWritePost', 'InsertLeave', 'TextChanged' },
      {
        callback = function()
          lint.try_lint()
        end
      })
  end,
}
