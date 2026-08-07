#!/bin/bash

last=""
playerctl metadata -F --format '{{status}}|{{title}}|{{artist}}|{{album}}|{{mpris:artUrl}}' 2>/dev/null |
while IFS='|' read -r status title artist album art; do
  if [ "$status" = "Playing" ] && [ -n "$title" ] && [ "$title" != "$last" ]; then
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
    notify-send -i "$cover" "$title" "${artist} — ${album}"
  fi
  last="$title"
done
