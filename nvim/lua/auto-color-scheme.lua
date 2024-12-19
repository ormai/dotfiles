-- https://github.com/f-person/auto-dark-mode.nvim

if pcall(vim.system, { 'gsettings', '--version' }) then
  -- To disable the timer :lua vim.fn.timer_stop(AutoColorScheme)
  AutoColorScheme = vim.fn.timer_start(
    3000, -- interval in ms
    function()
      vim.fn.jobstart(
        table.concat({
          'dbus-send --session --print-reply=literal --reply-timeout=1000',
          '--dest=org.freedesktop.portal.Desktop',
          '/org/freedesktop/portal/desktop',
          'org.freedesktop.portal.Settings.Read',
          "string:'org.freedesktop.appearance'",
          "string:'color-scheme'",
        }, ' '),
        -- https://github.com/flatpak/xdg-desktop-portal/blob/d7a304a00697d7d608821253cd013f3b97ac0fb6/data/org.freedesktop.impl.portal.Settings.xml#L33-L45
        {
          stdout_buffered = true,
          on_stdout = function(_, res)
            local scheme = string.match(res[1], 'uint32 1') ~= nil
                and 'dark' or 'light'
            if vim.o.background ~= scheme then
              vim.o.background = scheme
            end
          end
        }
      )
    end,
    { ['repeat'] = -1 } -- repeat forever
  )
end
