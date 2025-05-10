return {
  settings = {
    Lua = {
      hint = {
        enable = true,
        setType = true,
      },
      diagnostics = {
        globals = { 'vim' },
        neededFileStatus = {
          ['codestyle-check'] = 'Any'
        }
      },
      format = {
        defaultConfig = {
          indent_style = 'space',
          indent_size = '2',
          max_line_length = '80'
        }
      }
    }
  }
}
