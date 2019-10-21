# My Bash-specific Shell configuration.
# Written by Tiger Sachse.

# Enable Vi keybindings.
set -o vi

# Set the terminal prompt.
PS1="\[\e[1;93m\]>> \[\e[0m\]"

# Source global definitions if available.
if [ -f "/etc/bashrc" ]; then
    . "/etc/bashrc"
fi

# Load the generic Shell configuration file if it exists.
if [ -f "$HOME/.config/shell/shellrc" ]; then
    . "$HOME/.config/shell/shellrc"
fi

# Load the Shellcuts controller file if it exists.
if [ -f "$HOME/.shellcuts/shells/bash/controller.bash" ]; then
    . "$HOME/.shellcuts/shells/bash/controller.bash"
fi

# Load the Shellcuts controller file if it exists.
if [ -f $HOME/.shellcuts/shells/bash/controller.bash ]; then
    . $HOME/.shellcuts/shells/bash/controller.bash
fi
