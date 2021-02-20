# My Bash-specific Shell configuration.
# Written by Tiger Sachse.

# Enable Vi keybindings.
set -o vi

# Don't exit when I hit Ctrl-d.
set -o ignoreeof

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

# Add auto-completable note names for the paper() function.
complete -W "$(ls -1 $NOTES_DIR | cut -d "." -f 1)" paper

# Wire goto's autocompletion to the to() function.
complete -F _complete_goto_bash "to"
