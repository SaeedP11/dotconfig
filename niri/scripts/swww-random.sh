#!/bin/bash

# Directory containing your wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Select a random wallpaper from the directory
export WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) | shuf -n 1)

pkill waybar

# Check if a wallpaper was found
if [ -n "$WALLPAPER" ]; then
    # Set the wallpaper with swww
    swww img "$WALLPAPER" --transition-type wipe --transition-duration 2
    echo "Wallpaper changed to: $WALLPAPER"
else
    echo "No wallpaper found in $WALLPAPER_DIR"
    exit 1
fi

wallust run $WALLPAPER && waybar

