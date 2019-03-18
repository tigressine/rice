# The full version of my Bash configuration.
# Written by Tiger Sachse.

# Swap <caps lock> and <escape>.
setxkbmap -option caps:swapescape

# Source the simple version of this Bash configuration.
if [ -f "$HOME/.bashrc_simple" ]; then
    source "$HOME/.bashrc_simple"
fi

# Set the default editor to be Neovim.
export VISUAL=nvim
export EDITOR="$VISUAL"

# Load the Shellcuts controller file if it exists.
if [ -f $HOME/.shellcuts/shells/bash/controller.bash ]; then
    source $HOME/.shellcuts/shells/bash/controller.bash
fi

# Display a fun cowsay message.
GOOD_COWS="cock default dragon elephant gnu stegosaurus tux turtle sheep moose flaming-sheep"
SELECTED_COW=$(shuf -e $GOOD_COWS | head -1)
fortune fortunes | cowsay -f "$SELECTED_COW.cow" | lolcat; echo ""
