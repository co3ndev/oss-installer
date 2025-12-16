#!/bin/bash

# Build script by co3ndev.
# This script compiles the speficifed C++ source file into an object file using the specified compiler.
# Usage: ./build.sh

set -e

# USEREDITCONFIG 
NAME="co3ntools" #main source file
ADDTNL="" # additional source files, separated by a space

# do not change
SOURCE_FILE="$NAME.cpp $ADDTNL"
OUTPUT_FILE="$NAME"
COMPILER="g++"
CFLAGS="-Wall -Wextra -std=c++17 -O2"

# Check if source file exists
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: $SOURCE_FILE not found"
    sleep 0.25
    echo "Retrying install..."
    bash install.sh
fi

# Compile
# Check if g++ is installed
if [ ! command -v $COMPILER &> /dev/null ]; then
    echo "$COMPILER not found. Installing..."
    sudo apt update
    sudo apt install -y g++
fi

echo "Compiling $SOURCE_FILE..."
$COMPILER $CFLAGS -o $OUTPUT_FILE $SOURCE_FILE

echo "Build complete: $OUTPUT_FILE"
