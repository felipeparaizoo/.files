#!/bin/bash

chars=(" " "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█")

cava -p "$HOME/.config/waybar/scripts/cava-waybar.conf" 2>/dev/null |
while IFS= read -r line; do
  out=""
  IFS=';' read -ra vals <<< "$line"
  for v in "${vals[@]}"; do
    out+="${chars[$v]}"
  done
  echo "$out"
done
