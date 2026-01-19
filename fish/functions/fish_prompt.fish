function fish_prompt
    set_color $fish_color_cwd
    echo -n (prompt_pwd -D 1)
    set_color normal
    echo -n (fish_git_prompt)
    set_color yellow
    echo -n ' € '
    set_color normal
end
