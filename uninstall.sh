#!/bin/bash

# Uninstall script to remove files and configurations added by install.sh

set -e

# Configuration
NAME="co3ntools"
INSTALL_DIR="$HOME/.local/opt/$NAME"
BIN_DIR="$HOME/.local/bin"

echo "Starting uninstall process..."

# Remove symbolic links
if [ -L "$HOME/.local/bin/$NAME" ]; then
    rm "$HOME/.local/bin/$NAME"
    echo "Removed symbolic link from $BIN_DIR"
fi

# Remove installation directory
if [ -d "$INSTALL_DIR" ]; then
    rm -rf "$INSTALL_DIR"
    rmdir "$INSTALL_DIR"
    echo "Removed $INSTALL_DIR"
fi

# Remove bashrc configuration
if grep -q "$NAME" "$HOME/.bashrc"; then
    sed -i "/$NAME/d" "$HOME/.bashrc"
    echo "Removed $NAME configuration from ~/.bashrc"
fi

echo "Uninstall complete!"