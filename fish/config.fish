if status is-login
  source $HOME/.config/fish/env.fish
end

if status is-interactive
  if test $TERM = foot
    # Jumping between prompts
    function mark_prompt_start --on-event fish_prompt
      echo -en "\e]133;A\e\\"
    end
  end

  abbr s git status --short
  abbr d git diff
  abbr l git log --oneline --decorate --graph

  abbr --position anywhere ip ip -c
  abbr mv mv -iv
  abbr rm rm -i
  abbr cp cp -i
  abbr trash gio trash

  abbr adb HOME=$XDG_DATA_HOME/android adb
end
