# My ZSH-specific Shell configuration.
# Written by Tiger Sachse.

# Load the generic Shell configuration file if it exists.
if [ -f "$HOME/.shellrc" ]; then
    . "$HOME/.shellrc"
fi

# Load the Shellcuts controller file if it exists.
if [ -f "$HOME/.shellcuts/shells/zsh/controller.zsh" ]; then
    . "$HOME/.shellcuts/shells/zsh/controller.zsh"
fi

