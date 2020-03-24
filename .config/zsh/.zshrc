# ZSH Config

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.local/share/oh-my-zsh

ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh
# Load plugins
plugins=(
	git
	zsh-syntax-highlighting
)

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

# Include hidden files in autocomplete:
_comp_options+=(globdots)

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

function zle-keymap-select zle-line-init zle-line-finish
{
  case $KEYMAP in
      vicmd)      print -n '\033[1 q';; # block cursor
      viins|main) print -n '\033[5 q';; # line cursor
  esac
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# To put icons in lf
source "$HOME/.config/.lficons"
export LF_ICONS

# Cd in current directory when closing lf
source "$HOME/.config/lf/lfcd.sh"
bindkey -s '^o' 'lf\n'  # zsh

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

source "/usr/share/fzf/completion.zsh"
source "/usr/share/fzf/key-bindings.zsh"
