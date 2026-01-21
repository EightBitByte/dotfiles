SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SYMLINKS=(
  ".bashrc"
  ".config/hypr"
  ".config/nvim"
  ".config/waybar"
  ".config/kitty"
  "/etc/default/grub"
)

for symlink in "${SYMLINKS[@]}"; do
  source_file="$SOURCE_DIR/$symlink"
  target_file="$symlink"

  # Ensure parent directory exists (e.g. for .config/foo)
  mkdir -p "$(dirname "$target_file")"

  if [[ $symlink == "/"* ]]; then
    echo "Symlinking $source_file -> $target_file"
    ln -sf "$source_file" "$target_file"
  else
    echo "Symlinking $source_file -> $HOME/$target_file"
    ln -sf "$source_file" "$HOME/$target_file"
  fi
done
