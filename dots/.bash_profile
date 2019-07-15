# Simple .bash_profile that simply sources .bashrc if it exists.
# Written by Tiger Sachse.

if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
