#!/bin/bash

WALLDIR="$HOME/Imagens/walls"
TMP_PREVIEW_PID=""

# Cria mapeamento nome formatado -> caminho real
declare -A MAP
LIST=()
while IFS= read -r img; do
  name=$(basename "$img")
  base="${name%.*}"
  formatted=$(echo "$base" | sed -E 's/[-_]/ /g' | awk '{for(i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) substr($i,2)}}1')
  MAP["$formatted"]="$img"
  LIST+=("$formatted")
done < <(find -L "$WALLDIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" \))

# Função para mostrar preview no centro da tela usando imv
show_preview() {
  local img="$1"
  # Fecha preview anterior
  if [ -n "$TMP_PREVIEW_PID" ]; then
    kill "$TMP_PREVIEW_PID" 2>/dev/null
  fi
  # Abre preview centralizado (ajuste geometry se quiser)
  if [ -n "$img" ]; then
    imv --keep-open --geometry 800x450 --center "$img" &
    TMP_PREVIEW_PID=$!
  fi
}

# Mostra preview inicial (opcional)
show_preview "${MAP[${LIST[0]}]}"

# Escolha com Wofi fullscreen
SELECTION=$(printf '%s\n' "${LIST[@]}" | wofi --dmenu \
  --prompt " Wallpaper: " \
  --style ~/.config/wofi/style.css \
  --conf ~/.config/wofi/config)

[ -z "$SELECTION" ] && {
  # Fecha preview se sair
  [ -n "$TMP_PREVIEW_PID" ] && kill "$TMP_PREVIEW_PID"
  exit 0
}

# Fecha preview final
[ -n "$TMP_PREVIEW_PID" ] && kill "$TMP_PREVIEW_PID"

# Aplica wallpaper
IMG_PATH="${MAP[$SELECTION]}"
awww img "$IMG_PATH" --transition-type fade --transition-duration 1
