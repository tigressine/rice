# Install dots located in this repository.
# Written by Tiger Sachse.

mkdir -p "$HOME/.config/nvim/"
mkdir -p "$HOME/.config/shell/"
mkdir -p "$HOME/.shellcuts/data/"
mkdir -p "$HOME/.config/shell/aliases/"
mkdir -p "$HOME/.config/shell/configuration/"

cp .face "$HOME/"
cp .vimrc "$HOME/"
cp .bashrc "$HOME/"
cp .Xdefaults "$HOME/"
cp .tmux.conf "$HOME/"
cp .bash_profile "$HOME/"
cp .config/nvim/init.vim "$HOME/.config/nvim/"
cp .config/shell/shellrc "$HOME/.config/shell/"
cp .shellcuts/data/shellcuts.json "$HOME/.shellcuts/data/"
cp .config/shell/aliases/core_aliases "$HOME/.config/shell/aliases/"
cp .config/shell/configuration/core_configuration \
    "$HOME/.config/shell/configuration"

# Copy example local-override files onto the machine if no local overrides
# exist.
if [ ! -f "$HOME/.config/shell/configuration/local_configuration" ]; then
    cp .config/shell/configuration/local_configuration \
        "$HOME/.config/shell/configuration"
fi
if [ ! -f "$HOME/.config/shell/aliases/local_aliases" ]; then
    cp .config/shell/aliases/local_aliases "$HOME/.config/shell/aliases"
fi

# If a core installation is not requested, install extended configuration
# and alias files.
if [ "$1" != --core ]; then
    cp .config/shell/aliases/extended_aliases "$HOME/.config/shell/aliases/"
    cp .config/shell/configuration/extended_configuration \
        "$HOME/.config/shell/configuration"
fi
