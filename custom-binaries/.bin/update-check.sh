#!/usr/bin/env bash

set -u

OFFICIAL=$(checkupdates 2>/dev/null || true)
AUR=$(yay -Qua 2>/dev/null || true)

OFF_COUNT=$(echo "$OFFICIAL" | grep -c . || true)
AUR_COUNT=$(echo "$AUR" | grep -c . || true)
TOTAL=$((OFF_COUNT + AUR_COUNT))

if [ "$TOTAL" -eq 0 ]; then
    exit 0
fi

SUMMARY="$TOTAL atualizações disponíveis"
BODY="Oficiais: $OFF_COUNT | AUR: $AUR_COUNT"

notify-send -a "Update Check" -u normal "$SUMMARY" "$BODY"
