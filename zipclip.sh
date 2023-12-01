#!/bin/bash

# Check for 'zip' command
if ! command -v zip &> /dev/null; then
    echo "zip is not installed. Install it using: sudo apt-get install zip"
    exit 1
fi

# Check for 'xclip' command
if ! command -v xclip &> /dev/null; then
    echo "xclip is not installed. Install it using: sudo apt-get install xclip"
    exit 1
fi

# Flag for keeping the zip file
KEEP=false

# Process flags
while getopts ":k" opt; do
  case $opt in
    k)
      KEEP=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

# Shift off the options and optional --
shift $((OPTIND-1))

# Set the directory to the supplied argument or to the current directory if none supplied
DIR=${1:-$(pwd)}

# Save current directory and then change to target directory
CURRENT_DIR=$(pwd)
cd "$DIR"

# Create a zip file from the directory, excluding hidden files, and place it in the original directory
ZIPFILE="$CURRENT_DIR/${DIR##*/}.zip"
zip -r "$ZIPFILE" . -x ".*" "*/.*"

# Return to the original directory
cd "$CURRENT_DIR"

# Copy the zip file to the clipboard
xclip -selection clipboard -t application/zip -i "$ZIPFILE"

# Delete the zip file unless KEEP is true
if [ "$KEEP" = false ]; then
    rm "$ZIPFILE"
fi

