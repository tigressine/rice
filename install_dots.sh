# Install dots found in this repository.
# Written by Tiger Sachse.

DOTS_DIR="dots"

cp "$DOTS_DIR/.vimrc" "$HOME/"
cp "$DOTS_DIR/.zshrc" "$HOME/"
cp "$DOTS_DIR/.bashrc" "$HOME/"
cp "$DOTS_DIR/.shellrc" "$HOME/"
cp "$DOTS_DIR/.aliases" "$HOME/"
cp "$DOTS_DIR/.profile" "$HOME/"
cp "$DOTS_DIR/.bash_profile" "$HOME/"

# If a core installation is requested, only copy the
# core version of the Shell configuration in place of
# the extended Shell configuration, else copy everything.
if [ "$1" == "--core" ]; then
    cp "$DOTS_DIR/.core_shellrc" "$HOME/.shellrc"
else
    cp "$DOTS_DIR/.face" "$HOME/"
    cp "$DOTS_DIR/.shellrc" "$HOME/"
    cp "$DOTS_DIR/.Xresources" "$HOME/"
    cp "$DOTS_DIR/.core_shellrc" "$HOME/"

    mkdir -p "$HOME/.config/nvim/"
    mkdir -p "$HOME/.config/bspwm/"
    mkdir -p "$HOME/.config/sxhkd/"
    mkdir -p "$HOME/.config/polybar/"
    mkdir -p "$HOME/.shellcuts/data/"

    cp "$DOTS_DIR/.config/nvim/init.vim" "$HOME/.config/nvim/"
    cp "$DOTS_DIR/.config/bspwm/bspwmrc" "$HOME/.config/bspwm/"
    cp "$DOTS_DIR/.config/sxhkd/sxhkdrc" "$HOME/.config/sxhkd/"
    cp "$DOTS_DIR/.config/polybar/config" "$HOME/.config/polybar/"
    cp "$DOTS_DIR/.shellcuts/data/shellcuts.json" "$HOME/.shellcuts/data/"

    cat "$DOTS_DIR/.plankrc" | dconf load "/net/launchpad/plank/docks/"
fi
