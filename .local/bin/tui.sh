#!/bin/sh

# Toggle kitty padding for running a tui
# Usage: tui.sh nvim somefile.something ...

# Source https://www.reddit.com/r/vim/comments/ofe72k/disabling_terminal_padding_while_using_vim/

kitty @ set-spacing padding=0
"$@" # like a sandwich
kitty @ set-spacing padding=5
