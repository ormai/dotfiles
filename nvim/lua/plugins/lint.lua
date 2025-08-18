return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require('lint')

    lint.linters_by_ft = {
      make = { 'checkmake' },
      c = { 'trivy' },
      cpp = { 'trivy' },
      python = { 'trivy' },
      rust = { 'trivy' },
      java = { 'trivy' },
      javascript = { 'trivy' },
      typescript = { 'trivy' },
      dart = { 'trivy' },
      docker = { 'trivy' }
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
