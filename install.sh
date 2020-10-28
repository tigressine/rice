# Install dots located in this repository.
# Written by Tiger Sachse.

mkdir -p "$HOME/.config/nvim/"
mkdir -p "$HOME/.config/shell/"
mkdir -p "$HOME/.config/shell/aliases/"
mkdir -p "$HOME/.config/shell/configuration/"

cp dots/.face "$HOME/"
cp dots/.vimrc "$HOME/"
cp dots/.bashrc "$HOME/"
cp dots/.Xdefaults "$HOME/"
cp dots/.tmux.conf "$HOME/"
cp dots/.bash_profile "$HOME/"
cp dots/.config/nvim/init.vim "$HOME/.config/nvim/"
cp dots/.config/shell/shellrc "$HOME/.config/shell/"
cp dots/.config/shell/aliases/core_aliases "$HOME/.config/shell/aliases/"
cp dots/.config/shell/configuration/core_configuration \
    "$HOME/.config/shell/configuration"

# Copy example local-override files onto the machine if no local overrides
# exist.
if [ ! -f "$HOME/.config/shell/configuration/local_configuration" ]; then
    cp dots/.config/shell/configuration/local_configuration \
        "$HOME/.config/shell/configuration"
fi
if [ ! -f "$HOME/.config/shell/aliases/local_aliases" ]; then
    cp dots/.config/shell/aliases/local_aliases "$HOME/.config/shell/aliases"
fi

# If a core installation is not requested, install extended configuration
# and alias files.
if [ "$1" != --core ]; then
    cp dots/.config/shell/aliases/extended_aliases \
        "$HOME/.config/shell/aliases/"
    cp dots/.config/shell/configuration/extended_configuration \
        "$HOME/.config/shell/configuration"
    cat dots/.dconf | dconf load /
fi
