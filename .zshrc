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

# PATH MEOW
# ________  ________  _________  ___  ___     
#|\   __  \|\   __  \|\___   ___\\  \|\  \    
#\ \  \|\  \ \  \|\  \|___ \  \_\ \  \\\  \   
# \ \   ____\ \   __  \   \ \  \ \ \   __  \  
#  \ \  \___|\ \  \ \  \   \ \  \ \ \  \ \  \ 
#   \ \__\    \ \__\ \__\   \ \__\ \ \__\ \__\
#    \|__|     \|__|\|__|    \|__|  \|__|\|__|
#
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/.local/mybinz"

# PATH END

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# nice themes:
# pmcgee pretty nice and plain simple
# norm uses a nice lambda sign
# crunch uses a nice new line character
# jonathan has the nice line long frame
# funky is pretty cute
# jonathan:
# pa 6: frame and merryangel
# pa 2: directory and lain
# pa 3: date
# pa 4: date brackets
ZSH_THEME="norm"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Initialize Starship prompt
eval "$(starship init zsh)"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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

# FUNCTIONS END

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

