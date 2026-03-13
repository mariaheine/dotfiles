#!/usr/bin/env bash

DIR="${1:-.}"

# Find audio files
FILES=$(find "$DIR" -type f \( \
    -iname "*.mp3" -o -iname "*.wav" -o -iname "*.flac" -o -iname "*.ogg" -o \
    -iname "*.m4a" -o -iname "*.aac" \
\))

# If no files, exit
[ -z "$FILES" ] && echo "No audio files found in $DIR" && exit 1

# Use fzf with preview that plays audio
echo "$FILES" | fzf \
  --height=90% \
  --preview-window=down,10%,wrap \
  --preview 'mpv --no-video --quiet --volume=70 --start=0 --length=5 "{}" 2>/dev/null' \
  --bind "change:reload-sync:find '$DIR' -type f -print" \
  --bind "ctrl-c:abort" \
  --prompt="Select audio file ▶ "

SELECTED="$REPLY"

# Play the selected file fully
[ -n "$SELECTED" ] && mpv --no-video "$SELECTED"

