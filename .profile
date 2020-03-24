# Adds `~/.local/bin/` and all subdirectories to $PATH
export PATH="$PATH:$(du -L "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
# Adds `~/Android/Sdk/build-tools/29.0.2/` and all subdirectories to $PATH
export PATH="$PATH:$(du -L "$HOME/Android/Sdk/build-tools/29.0.2/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

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

# For Vulkan support
export VK_ICD_FILENAMES=/usr/share/vulkan/icd.d/intel_icd.x86_64.json:/usr/share/vulkan/icd.d/nv_vulkan_wrapper.json:/usr/share/vulkan/icd.d/nvidia_icd.json

# Navi path for cheats
export NAVI_PATH=/opt/navi/cheats:~/.config/navi/cheats

# For my notes program
export NOTES_HOME=/home/paolo/Documents/Notes

# For Java apps problem in dwm
export _JAVA_AWT_WM_NONREPARENTING=1

# Source .bashrc
echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "$HOME/.bashrc"

# Start graphical server if dwm not already running.
#[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x awesome >/dev/null && exec startx
