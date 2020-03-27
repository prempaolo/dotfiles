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
source "/home/paolo/.config/lf/lfcd.sh"

# fzf key bindings and completion
source "/usr/share/fzf/completion.bash"
source "/usr/share/fzf/key-bindings.bash"

# Colourful man pages
man() {
	env \
	LESS_TERMCAP_mb=$'\e[01;31m' \
	LESS_TERMCAP_md=$'\e[01;31m' \
	LESS_TERMCAP_me=$'\e[0m' \
	LESS_TERMCAP_se=$'\e[0m' \
	LESS_TERMCAP_so=$'\e[01;44;33m' \
	LESS_TERMCAP_ue=$'\e[0m' \
	LESS_TERMCAP_us=$'\e[01;32m' \
	man "$@"
}

# Used to set window name with the program executed in bash
#trap 'printf "\033]0;%s\007" "${BASH_COMMAND//[^[:print:]]/}"' DEBUG
