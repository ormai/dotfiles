#!/bin/sh

# grimblast based on grimshot
# https://github.com/OctopusET/sway-contrib

## Author: Misterio (https://github.com/misterio77)
## https://github.com/swaywm/sway/blob/master/contrib/grimshot

# Ported later to sh and sway by Mario D'Andrea <https://ormai.dev>

SCRIPT=$(basename "$0")

usage() {
  echo "$SCRIPT: take screenshots on sway using grim"
  echo "Usage: $SCRIPT [-chnms] [-f file] [-t target]"
  echo
  echo "Options:"
  echo "  -c         Copy screenshot to clipboard"
  echo "  -f file    Specify file to save the screenshot"
  echo "  -h         Show this help message"
  echo "  -n         Enable desktop notifications"
  echo "  -m         Include mouse pointer in the screenshot"
  echo "  -s         Save screenshot to file"
  echo "  -t target  Specify target of the screenshot"
  echo
  echo "Targets:"
  echo "  active     The currently focused container"
  echo "  area       Select container, output or custom area"
  echo "  output     The currently focused output"
  echo "  screen     All visible outputs"
}

have() {
  command -v "$1" >/dev/null || fatal "$1 is missing"
}

NOTIFY=false
TARGET=screen

while getopts cf:hnmst: option; do
  case "$option" in
  c)
    have wl-copy
    COPY=true
    ;;
  f) FILE="$OPTARG" && SAVE=true ;;
  h) usage && exit ;;
  n) NOTIFY=true ;;
  m) MOUSE=true ;;
  s) SAVE=true ;;
  t) TARGET="$OPTARG" ;;
  \?) exit 1 ;;
  esac
done

fatal() {
  msg=${1:-Error taking screenshot with "$SCRIPT"}
  if $NOTIFY; then
    notify-send -u critical -t 5000 -a "$SCRIPT" "$msg"
  else
    printf "\033[31merror\033[0m: %s\n" "$msg"
  fi
  exit 1
}

screenshot_directory() {
  . "${XDG_CONFIG_HOME:-$HOME/.config}/user-dirs.dirs" 2>/dev/null
  echo "${XDG_SCREENSHOTS_DIR:-${XDG_PICTURES_DIR:-$HOME}}"
}

notify() {
  if $NOTIFY; then
    notify-send ${SAVE:+-i $FILE} -u low -t 3000 -a "$SCRIPT" "$@"
  else
    echo "$SCRIPT:" "$@"
  fi
}

# If any of these is missing there is no point in continuing
for cmd in grim swaymsg jq; do
  have "$cmd"
done

case "$TARGET" in
active)
  focused=$(swaymsg -t get_tree |
    jq -r "recurse(.nodes[]?, .floating_nodes[]?) | select(.focused)")
  GEOMETRY=$(echo "$focused" |
    jq -r '.rect | "\(.x),\(.y) \(.width)x\(.height)"')
  TARGET="$(echo "$focused" | jq -r '.app_id') window"
  ;;
area)
  have slurp
  GEOMETRY=$(swaymsg -t get_tree |
    jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' |
    slurp -o)
  [ -z "$GEOMETRY" ] && exit # user did not select anything
  ;;
output)
  OUTPUT=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused)' |
    jq -r '.name')
  ;;
screen) ;;
*) fatal "Unknown target '$TARGET'" ;;
esac

if $SAVE; then
  FILE=${FILE:-$(screenshot_directory)/$(date +%FT%H-%M-%S%z).png} # ISO 8601
  if $COPY; then                                                   # copysave
    grim ${MOUSE:+-c} ${OUTPUT:+-o $OUTPUT} ${GEOMETRY:+-g "$GEOMETRY"} - |
      tee "$FILE" | wl-copy -t image/png
    notify "$TARGET copied to clipboard and saved to $FILE"
  else # save
    grim ${MOUSE:+-c} ${OUTPUT:+-o $OUTPUT} ${GEOMETRY:+-g "$GEOMETRY"} "$FILE"
    notify "$TARGET saved to $FILE"
  fi
else # copy
  grim ${MOUSE:+-c} ${OUTPUT:+-o $OUTPUT} ${GEOMETRY:+-g "$GEOMETRY"} - |
    wl-copy -t image/png
  notify "$TARGET copied to clipboard"
fi

case "$ACTION" in
save)
  grim ${MOUSE:+-c} ${OUTPUT:+-o $OUTPUT} ${GEOMETRY:+-g "$GEOMETRY"} "$FILE"
  notify "$TARGET saved to $FILE"
  ;;
copy)
  grim ${MOUSE:+-c} ${OUTPUT:+-o $OUTPUT} ${GEOMETRY:+-g "$GEOMETRY"} - |
    wl-copy -t image/png
  notify "$TARGET copied to clipboard"
  ;;
copysave)
  grim ${MOUSE:+-c} ${OUTPUT:+-o $OUTPUT} ${GEOMETRY:+-g "$GEOMETRY"} - |
    tee "$FILE" | wl-copy -t image/png
  notify "$TARGET copied to clipboard and saved to $FILE"
  ;;
esac
