#!/usr/bin/env bash
# Symlinks this repo's files into place in $HOME.
# Safe to re-run: skips files already linked, backs up anything else to *.bak.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$DOTFILES/$1" dest="$HOME/$2"
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    return
  fi
  if [ -e "$dest" ]; then
    mv "$dest" "$dest.bak"
    echo "backed up $dest -> $dest.bak"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "linked $dest -> $src"
}

link zshrc .zshrc
link zprofile .zprofile
link profile .profile
link tcshrc .tcshrc
link gitconfig .gitconfig
link claude/settings.json .claude/settings.json
link claude/themes/catppuccin-macchiato.json .claude/themes/catppuccin-macchiato.json
link ghostty/config .config/ghostty/config
