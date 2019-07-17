# Update the dots located in this repository.
# Written by Tiger Sachse.

cp "$HOME/.face" . > /dev/null 2>&1
cp "$HOME/.vimrc" . > /dev/null 2>&1
cp "$HOME/.zshrc" . > /dev/null 2>&1
cp "$HOME/.bashrc" . > /dev/null 2>&1
cp "$HOME/.shellrc" . > /dev/null 2>&1
cp "$HOME/.aliases" . > /dev/null 2>&1
cp "$HOME/.profile" . > /dev/null 2>&1
cp "$HOME/.Xresources" . > /dev/null 2>&1
cp "$HOME/.core_shellrc" . > /dev/null 2>&1
cp "$HOME/.bash_profile" . > /dev/null 2>&1

mkdir -p .config/nvim/
mkdir -p .config/bspwm/
mkdir -p .config/sxhkd/
mkdir -p .shellcuts/data/

cp "$HOME/.config/nvim/init.vim" .config/nvim/ > /dev/null 2>&1
cp "$HOME/.config/bspwm/bspwmrc" .config/bspwm/ > /dev/null 2>&1
cp "$HOME/.config/sxhkd/sxhkdrc" .config/sxhkd/ > /dev/null 2>&1
cp "$HOME/.shellcuts/data/shellcuts.json" .shellcuts/data/ > /dev/null 2>&1
