stty -ixon # Disable ctrl-s and ctrl-q.
HISTSIZE= HISTFILESIZE= # Infinite history.
HISTFILE="$HOME"/.config/bash/.bash_history
shopt -s autocd #Allows you to cd into directory merely by typing the directory name.

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# To put icons in lf
source "$HOME/.config/.lficons"
export LF_ICONS

# Enables vi commands
set -o vi

# Cd in current directory when closing lf
source "$HOME/.config/lf/lfcd.sh"

# fzf key bindings and completion
source "$HOME/.local/share/fzf/completion.bash"
source "$HOME/.local/share/fzf/key-bindings.bash"

# Used to set window name with the program executed in bash
#trap 'printf "\033]0;%s\007" "${BASH_COMMAND//[^[:print:]]/}"' DEBUG
