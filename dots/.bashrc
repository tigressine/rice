# The full version of my Bash configuration.
# Written by Tiger Sachse.

# Source the simple version of this Bash configuration.
if [ -f "$HOME/.bashrc_simple" ]; then
    source "$HOME/.bashrc_simple"
fi

# Set the default editor to be Neovim.
export VISUAL="vim"
export EDITOR="$VISUAL"

# Load the Shellcuts controller file if it exists.
if [ -f "$HOME/.shellcuts/shells/bash/controller.bash" ]; then
    source $HOME/.shellcuts/shells/bash/controller.bash
fi

# Display a fun cowsay message.
good_cows="cock default dragon elephant gnu stegosaurus tux turtle sheep moose flaming-sheep"
selected_cow=$(shuf -e $good_cows | head -1)
fortune fortunes | cowsay -f "$selected_cow.cow" | lolcat; echo ""
