#!/bin/bash

status=$(playerctl status 2>/dev/null)
if [ "$status" != "Playing" ]; then
  exit 0
fi

art=$(playerctl metadata mpris:artUrl 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
album=$(playerctl metadata album 2>/dev/null)

cover="/tmp/waybar-cover"

if [ -n "$art" ]; then
  if [ "$(cat "$cover.url" 2>/dev/null)" != "$art" ]; then
    if [[ "$art" == file://* ]]; then
      cp "${art#file://}" "$cover" 2>/dev/null
    else
      curl -fsSL -o "$cover" "$art" 2>/dev/null
    fi
    echo "$art" > "$cover.url"
  fi
fi

if [ -n "$title" ]; then
  notify-send -i "$cover" "$title" "${artist} — ${album}"
fi
