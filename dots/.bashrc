# If not running interactively, do nothing.
case $- in
    *i*)
        ;;
    *)
        return
        ;;
esac

# Set the default editor to be Neovim.
export VISUAL=nvim
export EDITOR="$VISUAL"

# Enable VI keybindings.
set -o vi

# Include the aliases file, if it exists.
if [ -f $HOME/.shell_aliases ]; then
    source $HOME/.shell_aliases
fi

# Load the Shellcuts controller file if it exists.
if [ -f $HOME/.shellcuts/shells/bash/controller.bash ]; then
    source $HOME/.shellcuts/shells/bash/controller.bash
fi

# Set the terminal prompt.
PS1="\[\033[38;5;11m\]->\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

# Display a fun cowsay message.
GOOD_COWS="cock default dragon elephant gnu stegosaurus tux turtle sheep moose flaming-sheep"
SELECTED_COW=$(shuf -e $GOOD_COWS | head -1)
fortune fortunes | cowsay -f "$SELECTED_COW.cow" | lolcat; echo ""
