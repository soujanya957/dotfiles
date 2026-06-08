#!/usr/bin/env bash

set -e

DOTFILES_DIR="$(pwd)"

# Map: source (in repo) -> target (in $HOME)
declare -A LINKS=(
  ["$DOTFILES_DIR/aerospace.toml"]="$HOME/.aerospace.toml"
  ["$DOTFILES_DIR/alacritty"]="$HOME/.alacritty"
  ["$DOTFILES_DIR/ghostty/config"]="$HOME/.config/ghostty/config"
  ["$DOTFILES_DIR/ghostty_config"]="$HOME/.ghostty_config"
  ["$DOTFILES_DIR/nvim"]="$HOME/.config/nvim"
  ["$DOTFILES_DIR/tmux.conf"]="$HOME/.tmux.conf"
  ["$DOTFILES_DIR/tmux-templates"]="$HOME/.tmux-templates"
)

for SRC in "${!LINKS[@]}"; do
  DEST="${LINKS[$SRC]}"
  DEST_DIR="$(dirname "$DEST")"
  mkdir -p "$DEST_DIR"
  if [ -L "$DEST" ]; then
    # If symlink exists, check if correct
    if [ "$(readlink "$DEST")" = "$SRC" ]; then
      echo "OK: $DEST -> $SRC"
      continue
    else
      echo "Updating symlink: $DEST"
      rm "$DEST"
    fi
  elif [ -e "$DEST" ]; then
    echo "Backing up existing file/dir: $DEST"
    mv "$DEST" "$DEST.backup.$(date +%s)"
  fi
  ln -s "$SRC" "$DEST"
  echo "Linked: $DEST -> $SRC"
done

