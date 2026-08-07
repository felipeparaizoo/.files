#!/bin/bash

esc() { printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'; }

status=$(playerctl status 2>/dev/null)
if [ -z "$status" ]; then
  echo '{"text": "", "class": "stopped"}'
  exit 0
fi

title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
album=$(playerctl metadata album 2>/dev/null)

pos=$(playerctl position 2>/dev/null | cut -d. -f1)
len=$(playerctl metadata mpris:length 2>/dev/null)

bar=""
if [ -n "$pos" ] && [ -n "$len" ] && [ "$len" -gt 0 ]; then
  width=20
  secs=$(( len / 1000000 ))
  if [ "$secs" -gt 0 ]; then
    pct=$(( pos * width / secs ))
    [ "$pct" -gt "$width" ] && pct=$width
    fill=$(printf '%*s' "$pct" '' | tr ' ' '█')
    empty=$(printf '%*s' "$((width-pct))" '' | tr ' ' '░')
    bar="${fill}${empty}"
  fi
fi

case "$status" in
  Playing) cls="playing" ;;
  Paused) cls="paused" ;;
  *) cls="stopped" ;;
esac

text=$(esc "${title} ${bar}")
tooltip="$(esc "$title")\\n$(esc "$artist")\\n$(esc "$album")"

printf '{"text": "%s", "tooltip": "%s", "class": "%s"}' "$text" "$tooltip" "$cls"
