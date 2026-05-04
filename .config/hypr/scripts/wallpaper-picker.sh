#!/bin/bash
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

chosen=$(ls "$WALLPAPER_DIR" | sed 's/\.[^.]*$//' | sed 's/./\u&/' | wofi --dmenu --prompt "Wallpaper")
[ -z "$chosen" ] && exit

actual=$(ls "$WALLPAPER_DIR/$(echo "$chosen" | sed 's/./\l&/')."* 2>/dev/null | head -n1)
[ -z "$actual" ] && exit

swww img "$actual" \
  --transition-type wipe \
  --transition-duration 1 \
  --transition-fps 60

ln -sf "$actual" ~/.cache/current_wallpaper
