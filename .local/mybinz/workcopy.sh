#!/usr/bin/env bash

set -euo pipefail

# Default mode: add
MODE="add"

usage() {
    echo "Usage: $0 [--add | --restore]"
    exit 1
}

# Parse CLI arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        -a|--add)
            MODE="add"
            shift
            ;;
        -r|--restore)
            MODE="restore"
            shift
            ;;
        -h|--help)
            usage
            ;;
        *)
            echo "Unknown option: $1"
            usage
            ;;
    esac
done

DELTA_OPTS="--theme=Dracula --line-numbers"

PREVIEW_CMD='
(
    echo -e "\033[1;34m▶ Unstaged changes (working tree):\033[0m";
    git diff --color=always -- {}; 
    echo;
    echo -e "\033[1;32m▶ Staged changes (index):\033[0m";
    git diff --cached --color=always -- {};
) | delta '"$DELTA_OPTS"


# Pick files from git status
FILES=$(
    git status --porcelain \
    | grep '^.[MDRA?]' \
    | cut -c4- \
    | sed 's/^"//; s/"$//' \
    | fzf -m --ansi --preview "$PREVIEW_CMD"
)

[[ -z "$FILES" ]] && exit 0

# Apply selected action
while IFS= read -r file; do
    case "$MODE" in
        add)
            git add "$file"
            ;;
        restore)
            git restore "$file"
            ;;
    esac
done <<< "$FILES"
