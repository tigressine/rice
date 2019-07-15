# Generic profile that simply sources the .shellrc.
# Written by Tiger Sachse.

if [ -f "$HOME/.shellrc" ]; then
    . "$HOME/.shellrc"
fi
