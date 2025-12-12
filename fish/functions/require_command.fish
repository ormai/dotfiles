# Checks if **all** the strings that it is passed are executable commands.
# Useful to declare and check the external dependencies of a shell function.
function require_command -d 'Check if a command is available'
    for cmd in $argv
        command -v $cmd &>/dev/null
        or begin
            error "'$cmd' is required but it's missing"
            return 127
        end
    end
end
