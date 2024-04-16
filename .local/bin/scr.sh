#!/bin/sh

# grimblast based on grimshot
# https://github.com/OctopusET/sway-contrib

## Author: Misterio (https://github.com/misterio77)
## https://github.com/swaywm/sway/blob/master/contrib/grimshot

# Ported later to sh and sway by Mario D'Andrea <https://ormai.dev>

SCRIPT=$(basename "$0")
NOTIFY=false
CURSOR=false # whether to include the mouse pointer in the screenshot

usage() {
  echo "Usage:
  $SCRIPT [-n|-c] [copy|save|copysave] [active|screen|output|area] [FILE|-]

Commands:
  copy: Copy the screenshot data into the clipboard.
  save: Save the screenshot to a regular file or '-' to pipe to STDOUT.
  copysave: Combine the previous 2 options.
  usage: Show this message and exit.

Targets:
  active: Currently active window.
  screen: All visible outputs.
  output: Currently active output.
  area: Manually select a region or window."
  exit 0
}

# parse options
while [ $# -gt 0 ]
do
  case "$1" in
  -c)
    CURSOR=true
    shift
    ;;
  -h) usage ;;
  -n)
    NOTIFY=true
    shift
    ;;
  *) break ;; # unknown option, done with parsing
  esac
done

notify() {
  $NOTIFY && notify-send -u low -t 3000 -a "$SCRIPT" "$@" || echo "$@"
}

fatal() {
  msg=${1:-Error taking screenshot with "$SCRIPT"}
  $NOTIFY && notify-send -u critical -t 5000 -a "$SCRIPT" "$msg" || echo "$msg"
  exit 2
}

check_dependency() {
  command -v "$1" > /dev/null || fatal "$1 is missing"
}

# If any of these is missing there is no point in continuing
for cmd in grim swaymsg jq
do
  check_dependency "$cmd"
done

screenshot_directory() {
  . "${XDG_CONFIG_HOME:-$HOME/.config}/user-dirs.dirs" 2> /dev/null
  echo "${XDG_SCREENSHOTS_DIR:-${XDG_PICTURES_DIR:-$HOME}}"
}

ACTION=${1:-save}
TARGET=${2:-screen}
FILE=${3:-$(screenshot_directory)/$(date +%FT%H-%M-%S%z).png} # ISO 8601 format

take_screenshot() {
  if [ -n "$3" ]
  then
    grim ${CURSOR:+-c} -o "$3" "$1"
  elif [ -z "$2" ]
  then
    grim ${CURSOR:+-c} "$1"
  else
    grim ${CURSOR:+-c} -g "$2" "$1"
  fi
}

case "$TARGET" in
  active)
    FOCUSED=$(swaymsg -t get_tree | jq -r 'recurse(.nodes[]?, .floating_nodes[]?) | select(.focused)')
    GEOMETRY=$(echo "$FOCUSED" | jq -r '.rect | "\(.x),\(.y) \(.width)x\(.height)"')
    APP_ID=$(echo "$FOCUSED" | jq -r '.app_id')
    WHAT="$APP_ID window"
    ;;
  screen)
    GEOMETRY=""
    WHAT="Screen"
    ;;
  output)
    GEOMETRY=""
    OUTPUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused)' | jq -r '.name')
    WHAT="$OUTPUT"
    ;;
  area)
    check_dependency slurp
    GEOMETRY=$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' | slurp -o)
    [ -z "$GEOMETRY" ] && exit 0 # user did not select area
    WHAT="Area"
    ;;
esac

case "$ACTION" in
  save)
    if take_screenshot "$FILE" "$GEOMETRY" "$OUTPUT"
    then
      notify -i "$FILE" "Screenshot of $TARGET" "$(basename "$FILE")"
    else
      fatal
    fi
    ;;
  copy)
    check_dependency wl-copy
    take_screenshot - "$GEOMETRY" "$OUTPUT" | wl-copy --type image/png
    notify "$WHAT copied to clipboard"
    ;;
  copysave)
    check_dependency wl-copy
    take_screenshot - "$GEOMETRY" "$OUTPUT" | tee "$FILE" | wl-copy --type image/png
    notify -i "$FILE" "$WHAT" "Copied to clipboard and saved to $FILE"
    ;;
esac
