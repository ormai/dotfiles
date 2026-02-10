function fish_prompt
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status

    set -l bold_flag --bold
    set -q __fish_prompt_status_generation
    or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus ' ' '' '|' "$status_color" "$statusb_color" $last_pipestatus)

    set -l cwd (set_color $fish_color_cwd) (prompt_pwd)
    set -l git (fish_git_prompt)
    set -l sym (set_color yellow) ' € '

    echo -n -s $cwd (set_color normal) $git $prompt_status $sym
end
