#!/usr/bin/env bash

# Link this repository's configs into $HOME.
# Re-run after adding a new top-level config directory.

set -eu

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}"
STAMP="$(date +%Y%m%d%H%M%S)"

mkdir -p "$CONFIG_DIR"

link() {
    local src="$1" dest="$2"

    if [ -L "$dest" ]; then
        rm "$dest"
    elif [ -e "$dest" ]; then
        mv "$dest" "$dest.backup.$STAMP"
        echo "Backed up $dest"
    fi

    ln -s "$src" "$dest"
    echo "Linked $dest -> $src"
}

# Config directories that live in ~/.config
for entry in ghostty nvim skhd tmux zsh; do
    [ -e "$DOTFILES_DIR/$entry" ] || continue
    link "$DOTFILES_DIR/$entry" "$CONFIG_DIR/$entry"
done

# Shell startup files
[ -f "$DOTFILES_DIR/zsh/.zshrc" ] && link "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
[ -f "$DOTFILES_DIR/zsh/.zprofile" ] && link "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"

# Clang tools look for this in parent directories, not in ~/.config
[ -f "$DOTFILES_DIR/.clang-format" ] && link "$DOTFILES_DIR/.clang-format" "$HOME/.clang-format"

echo "Dotfiles installed. Open a new terminal to load the shell config."
