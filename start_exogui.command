#!/bin/bash
# macOS launcher script for exogui
# Place this file in your eXoDOS folder and double-click to launch

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Export EXODOS_PATH so exogui knows where to find the game data
export EXODOS_PATH="$SCRIPT_DIR"

echo "Starting exogui with EXODOS_PATH=$EXODOS_PATH"

# Try to find exogui in common locations
EXOGUI_PATH=""

# Check if exogui is in a sibling folder
if [ -d "$SCRIPT_DIR/../exogui" ]; then
    EXOGUI_PATH="$SCRIPT_DIR/../exogui"
# Check if exogui is inside the eXoDOS folder
elif [ -d "$SCRIPT_DIR/exogui" ]; then
    EXOGUI_PATH="$SCRIPT_DIR/exogui"
# Check if exogui is in the same folder as this script
elif [ -f "$SCRIPT_DIR/package.json" ]; then
    EXOGUI_PATH="$SCRIPT_DIR"
fi

if [ -z "$EXOGUI_PATH" ]; then
    echo "Error: Could not find exogui folder."
    echo "Please ensure exogui is located at one of:"
    echo "  - $SCRIPT_DIR/../exogui"
    echo "  - $SCRIPT_DIR/exogui"
    echo ""
    echo "Or edit this script to set EXOGUI_PATH manually."
    read -p "Press Enter to exit..."
    exit 1
fi

cd "$EXOGUI_PATH"
echo "Running from: $EXOGUI_PATH"

# Check if dependencies are installed
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm install
fi

# Start exogui
npm run start
