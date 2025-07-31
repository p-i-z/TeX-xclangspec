#!/bin/bash 

# TeX-Xcode-setup.sh
# A script to install the TeX syntax highlighting plugin for Xcode.
# It copies the necessary files to their system locations.

# Exit immediately if any command fails
set -e

echo "Starting TeX for Xcode installation..."

# --- Define Source and Destination Paths ---
# Assume the script is run from the root of the project folder.
SOURCE_DIR=$(pwd)

# Destination directories
PLUGINS_DIR=~/Library/Developer/Xcode/Plug-ins
SPECS_DIR="/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageSpecifications"
METADATA_DIR="/Applications/Xcode.app/Contents/SharedFrameworks/SourceModel.framework/Versions/A/Resources/LanguageMetadata"
THEMES_DIR=~/Library/Developer/Xcode/UserData/FontAndColorThemes

# --- Verify Source Files Exist ---
if ! [ -d "$SOURCE_DIR/TeX.ideplugin" ] || ! [ -f "$SOURCE_DIR/TeX.xclangspec" ]; then
    echo "Error: Source files not found."
    echo "Please make sure you are running this script from inside the 'TeX-xclangspec GitHub' directory."
    exit 1
fi

# --- Create Directories and Copy Files ---

echo "Creating directories if they do not exist..."
mkdir -p "$PLUGINS_DIR"
# Note: System directories require sudo to create, but they should already exist.
# We will rely on sudo for the copy command if needed.
mkdir -p "$THEMES_DIR"

echo "Installing files..."

# User-level files
echo "Installing TeX.ideplugin..."
cp -R "$SOURCE_DIR/TeX.ideplugin" "$PLUGINS_DIR/"

echo "Installing Basic TeX.xccolortheme..."
cp "$SOURCE_DIR/Basic TeX.xccolortheme" "$THEMES_DIR/"

# System-level files
# These may require a password if System Integrity Protection is restrictive.
echo ""
echo "You may be asked for your administrator password to install system-level components."

echo "Installing TeX.xclangspec..."
sudo cp "$SOURCE_DIR/TeX.xclangspec" "$SPECS_DIR/"

echo "Installing Xcode.SourceCodeLanguage.TeX.plist..."
sudo cp "$SOURCE_DIR/Xcode.SourceCodeLanguage.TeX.plist" "$METADATA_DIR/"


# --- Final Instructions ---
echo ""
echo "--------------------------------------------------"
echo "Installation Complete!"
echo ""
echo "IMPORTANT NEXT STEPS:"
echo "1. Quit and Restart Xcode completely."
echo "2. When Xcode launches, click 'Load Bundle' when prompted."
echo "3. Go to Xcode > Settings > Themes and select 'Basic TeX'."
echo "--------------------------------------------------"
echo ""

exit 0
