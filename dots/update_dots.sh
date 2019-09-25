# Update the dots located in this repository.
# Written by Tiger Sachse.

cp "$HOME/.face" .
cp "$HOME/.vimrc" .
cp "$HOME/.bashrc" .
cp "$HOME/.Xdefaults" .
cp "$HOME/.tmux.conf" .
cp "$HOME/.bash_profile" .

mkdir -p .config/nvim/
mkdir -p .config/shell/
mkdir -p .shellcuts/data/
mkdir -p .config/shell/aliases/
mkdir -p .config/shell/configuration/

cp "$HOME/.config/nvim/init.vim" .config/nvim/
cp "$HOME/.config/shell/shellrc" .config/shell/
cp "$HOME/.config/shell/shellrc" .config/shell/
cp "$HOME/.config/shell/shellrc" .config/shell/
cp "$HOME/.config/shell/shellrc" .config/shell/
cp "$HOME/.config/shell/shellrc" .config/shell/
cp "$HOME/.config/shell/shellrc" .config/shell/
cp "$HOME/.shellcuts/data/shellcuts.json" .shellcuts/data/
cp "$HOME/.config/shell/aliases/core_aliases" .config/shell/aliases/
cp "$HOME/.config/shell/aliases/extended_aliases" .config/shell/aliases/
cp "$HOME/.config/shell/configuration/core_configuration" \
    .config/shell/configuration/
cp "$HOME/.config/shell/configuration/extended_configuration" \
    .config/shell/configuration/
