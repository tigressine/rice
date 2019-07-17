# My Bash-specific Shell configuration.
# Written by Tiger Sachse.

# Load the generic Shell configuration file if it exists.
if [ -f "$HOME/.shellrc" ]; then
    . "$HOME/.shellrc"
fi

# Source global definitions if available.
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Enable Vi keybindings.
set -o vi

# Load the Shellcuts controller file if it exists.
if [ -f "$HOME/.shellcuts/shells/bash/controller.bash" ]; then
    . "$HOME/.shellcuts/shells/bash/controller.bash"
fi

# Set the terminal prompt.
#PS1="\[\033[38;5;11m\]>>\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
PS1="\e[1;93m>> \[\e[21;39m"
