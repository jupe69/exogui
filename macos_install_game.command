#!/bin/bash
# macOS Game Installer for eXoDOS Lite
# This script extracts a game from its ZIP file
#
# Usage: ./macos_install_game.command "Game Name"
# Or double-click and enter the game name when prompted

# Get the directory where this script is located (should be in eXoDOS folder)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Check if we're in the eXoDOS folder
if [ ! -d "$SCRIPT_DIR/eXo/eXoDOS" ]; then
    echo "Error: This script must be placed in your eXoDOS folder."
    echo "Expected to find: $SCRIPT_DIR/eXo/eXoDOS"
    read -p "Press Enter to exit..."
    exit 1
fi

EXODOS_PATH="$SCRIPT_DIR/eXo/eXoDOS"
ZIP_FOLDER="$SCRIPT_DIR/eXo/eXoDOS"

# Get game name from argument or prompt
if [ -n "$1" ]; then
    GAME_NAME="$1"
else
    echo "=== eXoDOS Lite Game Installer for macOS ==="
    echo ""
    echo "Available games (ZIP files):"
    echo ""
    ls "$ZIP_FOLDER"/*.zip 2>/dev/null | head -20 | while read f; do
        basename "$f" .zip
    done
    echo ""
    echo "(Showing first 20 games. More may be available.)"
    echo ""
    read -p "Enter the game name (without .zip): " GAME_NAME
fi

# Find the ZIP file
ZIP_FILE="$ZIP_FOLDER/$GAME_NAME.zip"

if [ ! -f "$ZIP_FILE" ]; then
    # Try case-insensitive search
    ZIP_FILE=$(find "$ZIP_FOLDER" -maxdepth 1 -iname "$GAME_NAME.zip" -print -quit 2>/dev/null)
fi

if [ ! -f "$ZIP_FILE" ]; then
    echo "Error: Could not find ZIP file for '$GAME_NAME'"
    echo "Looked for: $ZIP_FOLDER/$GAME_NAME.zip"
    read -p "Press Enter to exit..."
    exit 1
fi

echo ""
echo "Found: $ZIP_FILE"
echo "Extracting to: $EXODOS_PATH/"
echo ""

# Check if 7za is available (from exogui), otherwise use unzip
SEVENZA=""
if [ -f "$SCRIPT_DIR/../exogui/extern/7zip-bin/mac/7za" ]; then
    SEVENZA="$SCRIPT_DIR/../exogui/extern/7zip-bin/mac/7za"
elif [ -f "$SCRIPT_DIR/exogui/extern/7zip-bin/mac/7za" ]; then
    SEVENZA="$SCRIPT_DIR/exogui/extern/7zip-bin/mac/7za"
elif command -v 7za &> /dev/null; then
    SEVENZA="7za"
fi

if [ -n "$SEVENZA" ]; then
    echo "Using 7za for extraction..."
    "$SEVENZA" x -y -o"$EXODOS_PATH" "$ZIP_FILE"
else
    echo "Using unzip for extraction..."
    unzip -o "$ZIP_FILE" -d "$EXODOS_PATH"
fi

if [ $? -eq 0 ]; then
    echo ""
    echo "Game '$GAME_NAME' installed successfully!"
    echo "You can now launch it from exogui."
else
    echo ""
    echo "Error during extraction. Please check the output above."
fi

echo ""
read -p "Press Enter to exit..."
