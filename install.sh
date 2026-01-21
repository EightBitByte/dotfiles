SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SYMLINKS=(
  "$HOME/.bashrc"
  "$HOME/.config/hypr"
  "$HOME/.config/nvim"
  "$HOME/.config/waybar"
  "/etc/default/grub"
)

for symlink in "${SYMLINKS[@]}"; do
  source_file="$SOURCE_DIR/$symlink"
  target_file="$symlink"

  # Ensure parent directory exists (e.g. for .config/foo)
  mkdir -p "$(dirname "$target_file")"

  echo "Symlinking $source_file -> $target_file"
  # -s: symbolic, -f: force (overwrite existing)
  ln -sf "$source_file" "$target_file"
done