# My Bash-specific Shell configuration.
# Written by Tiger Sachse.

# Load the generic Shell configuration file if it exists.
if [ -f "$HOME/.shellrc" ]; then
    . "$HOME/.shellrc"
fi

# Load the Shellcuts controller file if it exists.
if [ -f "$HOME/.shellcuts/shells/bash/controller.bash" ]; then
    . "$HOME/.shellcuts/shells/bash/controller.bash"
fi

