#!/usr/bin/env bash

DIR="${1:-.}"

# Collect audio files (add/remove extensions as needed)
find "$DIR" -type f \( \
    -iname "*.mp3" -o -iname "*.wav" -o -iname "*.flac" -o -iname "*.ogg" -o \
    -iname "*.m4a" -o -iname "*.aac" \
\) |
fzf --height=90% \
    --border \
    --prompt="🎧 Select audio ▶ " \
    --preview-window=down,8,wrap \
    --preview 'ffplay -nodisp -autoexit -loglevel quiet {}' |
while read -r SELECTED; do
    # Play the selected file fully after choosing it
    [ -n "$SELECTED" ] && ffplay -nodisp -autoexit "$SELECTED"
done

