# Install dots found in this repository.
# Written by Tiger Sachse.

cp .vimrc "$HOME/"
cp .zshrc "$HOME/"
cp .bashrc "$HOME/"
cp .shellrc "$HOME/"
cp .aliases "$HOME/"
cp .profile "$HOME/"
cp .bash_profile "$HOME/"

# If a core installation is requested, only copy the
# core version of the Shell configuration in place of
# the extended Shell configuration, else copy everything.
if [ "$1" == --core ]; then
    cp .core_shellrc "$HOME/.shellrc"
else
    cp .face "$HOME/"
    cp .shellrc "$HOME/"
    cp .Xresources "$HOME/"
    cp .core_shellrc "$HOME/"

    mkdir -p "$HOME/.config/xob/"
    mkdir -p "$HOME/.config/nvim/"
    mkdir -p "$HOME/.config/bspwm/"
    mkdir -p "$HOME/.config/sxhkd/"
    mkdir -p "$HOME/.config/polybar/"
    mkdir -p "$HOME/.shellcuts/data/"

    cp .config/xob/styles.cfg "$HOME/.config/xob"
    cp .config/nvim/init.vim "$HOME/.config/nvim/"
    cp .config/bspwm/bspwmrc "$HOME/.config/bspwm/"
    cp .config/sxhkd/sxhkdrc "$HOME/.config/sxhkd/"
    cp .config/polybar/config "$HOME/.config/polybar/"
    cp .shellcuts/data/shellcuts.json "$HOME/.shellcuts/data/"

    cat .plankrc | dconf load /net/launchpad/plank/docks/
fi
