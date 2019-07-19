# My ZSH-specific Shell configuration.
# Written by Tiger Sachse.

# Load the generic Shell configuration file if it exists.
if [ -f "$HOME/.shellrc" ]; then
    . "$HOME/.shellrc"
fi

# Source the Amazon-specific configuration file, if available.
if [ -f "$HOME/.amazon_zshrc" ]; then
    . "$HOME/.amazon_zshrc"
fi

# Use Vi bindings.
bindkey -v

# Load the Shellcuts controller file if it exists.
if [ -f "$HOME/.shellcuts/shells/zsh/controller.zsh" ]; then
    . "$HOME/.shellcuts/shells/zsh/controller.zsh"
fi

# Set the terminal prompt.
PROMPT=">> "

# Load the Shellcuts controller file if it exists.
if [ -f $HOME/.shellcuts/shells/zsh/controller.sh ]; then
    . $HOME/.shellcuts/shells/zsh/controller.sh
fi
