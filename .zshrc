#         ___           ___           ___           ___           ___
#        /\__\         /\__\         /\  \         /\  \         /\__\
#       /::|  |       /:/ _/_        \:\  \       /::\  \       /:/  /
#      /:/:|  |      /:/ /\  \        \:\  \     /:/\:\__\     /:/  /
#     /:/|:|  |__   /:/ /::\  \   ___ /::\  \   /:/ /:/  /    /:/  /  ___
#    /:/ |:| /\__\ /:/_/:/\:\__\ /\  /:/\:\__\ /:/_/:/__/___ /:/__/  /\__\
#    \/__|:|/:/  / \:\/:/ /:/  / \:\/:/  \/__/ \:\/:::::/  / \:\  \ /:/  /
#        |:/:/  /   \::/ /:/  /   \::/__/       \::/~~/~~~~   \:\  /:/  /
#        |::/  /     \/_/:/  /     \:\  \        \:\~~\        \:\/:/  /
#        |:/  /        /:/  /       \:\__\        \:\__\        \::/  /
#        |/__/         \/__/         \/__/         \/__/         \/__/
#

#
# PATH MEOW
# ________  ________  _________  ___  ___
#|\   __  \|\   __  \|\___   ___\\  \|\  \
#\ \  \|\  \ \  \|\  \|___ \  \_\ \  \\\  \
# \ \   ____\ \   __  \   \ \  \ \ \   __  \
#  \ \  \___|\ \  \ \  \   \ \  \ \ \  \ \  \
#   \ \__\    \ \__\ \__\   \ \__\ \ \__\ \__\
#    \|__|     \|__|\|__|    \|__|  \|__|\|__|
#
PATH="$PATH:$HOME/.dotnet/tools"
PATH="$PATH:$HOME/.local/mybinz"
PATH="$PATH:$HOME/.local/bin"
export PATH

# PATH END

#  _______   ___  ________   ________  _______   ___       __   _______   ___  ________  _______
# |\  ___ \ |\  \|\   ___  \|\   ____\|\  ___ \ |\  \     |\  \|\  ___ \ |\  \|\   ___ \|\  ___ \
# \ \   __/|\ \  \ \  \\ \  \ \  \___|\ \   __/|\ \  \    \ \  \ \   __/|\ \  \ \  \_|\ \ \   __/|
#  \ \  \_|/_\ \  \ \  \\ \  \ \  \  __\ \  \_|/_\ \  \  __\ \  \ \  \_|/_\ \  \ \  \ \\ \ \  \_|/__
#   \ \  \_|\ \ \  \ \  \\ \  \ \  \|\  \ \  \_|\ \ \  \|\__\_\  \ \  \_|\ \ \  \ \  \_\\ \ \  \_|\ \
#    \ \_______\ \__\ \__\\ \__\ \_______\ \_______\ \____________\ \_______\ \__\ \_______\ \_______\
#     \|_______|\|__|\|__| \|__|\|_______|\|_______|\|____________|\|_______|\|__|\|_______|\|_______|
# zsh config basically

# path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' mode reminder # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

source $ZSH/oh-my-zsh.sh

# Initialize Starship prompt
eval "$(starship init zsh)"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# EINGEWEIDE END

# ALIASES MEOW
#  ______  __
# /\  _  \/\ \       __
# \ \ \L\ \ \ \     /\_\     __      ____     __    ____
#  \ \  __ \ \ \  __\/\ \  /'__`\   /',__\  /'__`\ /',__\
#   \ \ \/\ \ \ \L\ \\ \ \/\ \L\.\_/\__, `\/\  __//\__, `\
#    \ \_\ \_\ \____/ \ \_\ \__/.\_\/\____/\ \____\/\____/
#     \/_/\/_/\/___/   \/_/\/__/\/_/\/___/  \/____/\/___/
#
alias zshs='source ~/.zshrc'
alias zshed='nvim ~/.zshrc'

# lsd
alias la='lsd -la'

# Unity
alias killunity='pkill -9 -f "/Editor/Unity"; rm -f ~/Projects/sanctuary/sanctuary/sanctuary/Temp/UnityLockfile'
alias sanctuary='/home/merryangel/Projects/sanctuary/builds/Development/1.6.0.sanctuary.coreprincess/Linux/sanctuary.x86_64'

# Apps
alias shotcut='~/Applications/Shotcut-25.11.AppImage'
alias blender='~/Applications/blender-5.1.0-linux-x64/blender'
alias godot='~/Applications/Godot_v4.6.1-stable_mono_linux_x86_64/Godot_v4.6.1-stable_mono_linux.x86_64'

# Nvim
# remember to use the archive version not the appimage
alias nvim='~/Applications/nvim_0.11.6/nvim-linux-x86_64/bin/nvim'

# tmux
alias tmed='nvim ~/.tmux.conf'
alias tms='tmux source-file ~/.tmux.conf'
alias tmks='tmux kill-server'

# Python
alias venv='source .venv/bin/activate'

# dotfiles
# www.atlassian.com/git/tutorials/dotfiles
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# ALIASES END
#  ________ ___  ___  ________   ________ _________  ___  ________  ________   ________
# |\  _____\\  \|\  \|\   ___  \|\   ____\\___   ___\\  \|\   __  \|\   ___  \|\   ____\
# \ \  \__/\ \  \\\  \ \  \\ \  \ \  \___\|___ \  \_\ \  \ \  \|\  \ \  \\ \  \ \  \___|_
#  \ \   __\\ \  \\\  \ \  \\ \  \ \  \       \ \  \ \ \  \ \  \\\  \ \  \\ \  \ \_____  \
#   \ \  \_| \ \  \\\  \ \  \\ \  \ \  \____   \ \  \ \ \  \ \  \\\  \ \  \\ \  \|____|\  \
#    \ \__\   \ \_______\ \__\\ \__\ \_______\  \ \__\ \ \__\ \_______\ \__\\ \__\____\_\  \
#     \|__|    \|_______|\|__| \|__|\|_______|   \|__|  \|__|\|_______|\|__| \|__|\_________\
#                                                                                \|_________|

# DERP, NO FUNCTIONS CURRENTLY

inotify-check() {
    echo "=== Watches in use ==="
    for pid in /proc/[0-9]*/; do
        count=$(cat ${pid}fdinfo/* 2>/dev/null | grep -c inotify)
        [ "$count" -gt 0 ] && echo "$count\t$(cat ${pid}comm 2>/dev/null) (pid ${pid//[^0-9]/})"
    done | sort -rn
    echo ""
    echo "=== Instances in use ==="
    for pid in /proc/[0-9]*/; do
        count=$(grep -rl "inotify" ${pid}fdinfo/ 2>/dev/null | wc -l)
        [ "$count" -gt 0 ] && echo "$count\t$(cat ${pid}comm 2>/dev/null) (pid ${pid//[^0-9]/})"
    done | sort -rn
    echo "=== Limits ==="
    echo "max_user_watches:   $(cat /proc/sys/fs/inotify/max_user_watches)"
    echo "max_user_instances: $(cat /proc/sys/fs/inotify/max_user_instances)"
    echo ""
}

# FUNCTIONS END

#  ________  ___       __   _______   _______  _________  ________
# |\   ____\|\  \     |\  \|\  ___ \ |\  ___ \|\___   ___\\   ____\
# \ \  \___|\ \  \    \ \  \ \   __/|\ \   __/\|___ \  \_\ \  \___|_
#  \ \_____  \ \  \  __\ \  \ \  \_|/_\ \  \_|/__  \ \  \ \ \_____  \
#   \|____|\  \ \  \|\__\_\  \ \  \_|\ \ \  \_|\ \  \ \  \ \|____|\  \
#     ____\_\  \ \____________\ \_______\ \_______\  \ \__\  ____\_\  \
#    |\_________\|____________|\|_______|\|_______|   \|__| |\_________\
#    \|_________|                                           \|_________|
# Various things

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# SWEETS END
