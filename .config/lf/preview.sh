#!/bin/sh

# File previews for lf <https://github.com/gokcehan/lf/>

image() {
  chafa -f sixel -s "$2x$3" --animate off --polite on "$1"
  exit
}

case "$1" in
  *.cbz|*.cbr|*.cb7|*.cbt|*.cba)
    cache_file="$XDG_CACHE_HOME/lfpreview/$(echo "$1" | sha256sum)"
    [ -e "$cache_file" ] || comicthumb "$1" "$cache_file" 1080
    image "$cache_file" "$2" "$3"
    ;;
  *.o) nm "$1" ;;
esac

case "$(file -Lb --mime-type "$1")" in
  video/*)
    cache_file="$XDG_CACHE_HOME/lfpreview/$(echo "$1" | sha256sum)"
    [ -e "$cache_file" ] || ffmpegthumbnailer -s 0 -i "$1" -o "$cache_file"
    image "$cache_file" "$2" "$3"
    ;;
  image/vnd.djvu)
    cache_file="$XDG_CACHE_HOME/lfpreview/$(echo "$1" | sha256sum)"
    [ -e "$cache_file" ] || ddjvu -format=tiff -quality=25 -page=1 "$1" "$cache_file"
    image "$cache_file" "$2" "$3"
    ;;
  image/svg*)
    cache_file="$XDG_CACHE_HOME/lfpreview/$(echo "$1" | sha256sum).jpg"
    [ -e "$cache_file" ] || convert "$1" "$cache_file"
    image "$cache_file" "$2" "$3"
    ;;
  image/*) image "$@" ;;
  application/epub+zip)
    cache_file="$XDG_CACHE_HOME/lfpreview/$(echo "$1" | sha256sum)"
    [ -e "$cache_file" ] || gnome-epub-thumbnailer -s 1080 "$1" "$cache_file"
    image "$cache_file" "$2" "$3"
    ;;
  application/pdf)
    cache_file="$XDG_CACHE_HOME/lfpreview/$(echo "$1" | sha256sum)"
    [ -e "$cache_file" ] || pdftoppm -jpeg -f 1 -singlefile "$1" "$cache_file"
    image "$cache_file".jpg "$2" "$3"
    ;;
  application/zip) atool -l "$1" ;;
  application/*document*)
    file_name=$(basename "$1")
    cache_file="$XDG_CACHE_HOME/lfpreview/${file_name%%.*}.jpg"
    [ -e "$cache_file" ] || libreoffice --convert-to jpg "$1" --outdir "$XDG_CACHE_HOME/lfpreview/" > /dev/null
    image "$cache_file" "$2" "$3"
    ;;
  text/*)
    case "$1" in
      *.md) glow "$1" ;;
      *) bat --color always -pp "$1" ;;
    esac
    ;;
  *) exiftool "$1" ;;
esac
