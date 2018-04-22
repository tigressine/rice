### BASH PROFILE ###
# Executed by bash for login shells
# Only run at login, usually

# Include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/Bin" ] ; then
    PATH="$HOME/Bin:$PATH"
fi
