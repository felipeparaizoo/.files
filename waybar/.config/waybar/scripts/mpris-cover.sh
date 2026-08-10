#!/bin/bash

status=$(playerctl status 2>/dev/null)
cover="/tmp/waybar-cover"
png="$cover.png"

if [ -z "$status" ] || [ "$status" = "Stopped" ]; then
  rm -f "$png" "$cover" "$cover.url"
  exit 0
fi

if [ "$status" != "Playing" ]; then
  exit 0
fi

art=$(playerctl metadata mpris:artUrl 2>/dev/null)
if [ -z "$art" ]; then
  exit 0
fi

if [ "$(cat "$cover.url" 2>/dev/null)" != "$art" ]; then
  if [[ "$art" == file://* ]]; then
    cp "${art#file://}" "$cover" 2>/dev/null
  else
    curl -fsSL -o "$cover" "$art" 2>/dev/null
  fi
  magick "$cover" -resize 22x22! -alpha set \( -size 22x22 xc:none -fill white -draw "roundrectangle 0,0,21,21,6,6" \) -compose CopyOpacity -composite "$png" 2>/dev/null
  echo "$art" > "$cover.url"
fi

if [ -f "$png" ]; then
  echo "$png"
fi
