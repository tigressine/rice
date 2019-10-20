# Update the dots located in this repository.
# Written by Tiger Sachse.

cp "$HOME/.face" dots/
cp "$HOME/.vimrc" dots/
cp "$HOME/.bashrc" dots/
cp "$HOME/.Xdefaults" dots/
cp "$HOME/.tmux.conf" dots/
cp "$HOME/.bash_profile" dots/

mkdir -p dots/.config/nvim/
mkdir -p dots/.config/shell/
mkdir -p dots/.shellcuts/data/
mkdir -p dots/.config/dropbox/
mkdir -p dots/.config/shell/aliases/
mkdir -p dots/.config/shell/configuration/

cp "$HOME/.config/nvim/init.vim" dots/.config/nvim/
cp "$HOME/.config/shell/shellrc" dots/.config/shell/
cp "$HOME/.config/dropbox/config.sh" dots/.config/dropbox/
cp "$HOME/.shellcuts/data/shellcuts.json" dots/.shellcuts/data/
cp "$HOME/.config/shell/aliases/core_aliases" dots/.config/shell/aliases/
cp "$HOME/.config/shell/aliases/extended_aliases" dots/.config/shell/aliases/
cp "$HOME/.config/shell/configuration/core_configuration" \
    dots/.config/shell/configuration/
cp "$HOME/.config/shell/configuration/extended_configuration" \
    dots/.config/shell/configuration/
