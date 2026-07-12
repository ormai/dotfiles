function autols -d 'List files after changing directory' --on-event fish_prompt
    # https://github.com/rstacruz/fish-autols/blob/master/conf.d/autols.fish
    if test "$autols_last_dir" != (pwd)
        eza
    end
    set -g autols_last_dir (pwd)
end
