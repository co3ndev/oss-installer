#!/bin/bash

set -e

# co3ndev installation script
NAME="co3ntools"
REPO="https://github.com/co3ndev/$NAME.git"
INSTALL_DIR="$HOME/.local/opt/$NAME"
BIN_DIR="$HOME/.local/bin"

echo "Installing $NAME..."

# Create directories
mkdir -p "$INSTALL_DIR"
mkdir -p "$BIN_DIR"

# Clone repository
if [ -d "$INSTALL_DIR/.git" ]; then
    echo "Updating existing installation..."
    cd "$INSTALL_DIR"
    git pull
else
    echo "Cloning repository..."
    git clone "$REPO" "$INSTALL_DIR"
    cd "$INSTALL_DIR"
fi

# Build/install the binary
if [ ! -f "$BIN_DIR/$NAME.o" ]; then
    bash build.sh
    cp "$NAME" "$BIN_DIR/"
fi

# Create alias symlink
ln -sf "$BIN_DIR/$NAME" "$BIN_DIR/$NAME"

# Add to PATH if not already present
if ! grep -q "$BIN_DIR" "$HOME/.bashrc"; then
    echo "export PATH=\"\$PATH:$BIN_DIR\"" >> "$HOME/.bashrc"
fi

echo "$NAME installed successfully!"
echo "Run '$NAME' help for help."