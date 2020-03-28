# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$(du -L "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//'):$PATH"
# Adds `~/Android/Sdk/build-tools/29.0.2/` and all subdirectories to $PATH if they exist
[ -d "$HOME/.config/java/Android/Sdk/build-tools/29.0.2" ] &&
	export PATH="$PATH:$(du -L "$HOME/.config/java/Android/Sdk/build-tools/29.0.2/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Home-clean for java (puts all the directories created by java and programs using java in ~/.config/java)
[ ! -d "$HOME/.config/java" ] && mkdir "$HOME/.config/java"
export _JAVA_OPTIONS="-Duser.home=$HOME/.config/java -Duser.dir=$HOME/.config/java"

# Default programs
export EDITOR="nvim"
export TERMINAL="termite"
export BROWSER="brave"
export READER="zathura"
export FILE="lf"
export OPENER="xdg-open"
export SHELL=/bin/zsh
# Needed, otherwise mailsync returns error
export STATUSBAR="lel"

# Clean-up
export NOTMUCH_CONFIG="$HOME/.config/notmuch/config"
export LESSHISTFILE="-"
export PASSWORD_STORE_DIR="$HOME/.local/share/password-store"
export ZDOTDIR="$HOME/.config/zsh"
export GOPATH="$HOME/.config/go"
# For nvidia drivers
[ ! -d "$HOME/.config/nvidia" ] && mkdir "$HOME/.config/nvidia"
export __GL_SHADER_DISK_CACHE_PATH="$HOME/.config/nvidia"

# Colored man pages
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
export LESS_TERMCAP_md=$(tput bold; tput setaf 6) # cyan
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4) # yellow on blue
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2) # green
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export GROFF_NO_SGR=1   

# For Vulkan support
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json:/usr/share/vulkan/icd.d/nv_vulkan_wrapper.json:/usr/share/vulkan/icd.d/nvidia_icd.json

# Navi path for cheats
export NAVI_PATH=/opt/navi/cheats:"$HOME"/.config/navi/cheats

# For Java apps problem in dwm
export _JAVA_AWT_WM_NONREPARENTING=1

# Start graphical server if dwm not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x dwm >/dev/null && exec startx
