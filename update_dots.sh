# Update the dots located in this repository.
# Written by Tiger Sachse.

DOTS_DIR="dots"

cp "$HOME/.face" "$DOTS_DIR" > /dev/null 2>&1
cp "$HOME/.vimrc" "$DOTS_DIR" > /dev/null 2>&1
cp "$HOME/.zshrc" "$DOTS_DIR" > /dev/null 2>&1
cp "$HOME/.bashrc" "$DOTS_DIR" > /dev/null 2>&1
cp "$HOME/.shellrc" "$DOTS_DIR" > /dev/null 2>&1
cp "$HOME/.aliases" "$DOTS_DIR" > /dev/null 2>&1
cp "$HOME/.profile" "$DOTS_DIR" > /dev/null 2>&1
cp "$HOME/.Xresources" "$DOTS_DIR" > /dev/null 2>&1
cp "$HOME/.core_shellrc" "$DOTS_DIR" > /dev/null 2>&1
cp "$HOME/.bash_profile" "$DOTS_DIR" > /dev/null 2>&1

mkdir -p "$DOTS_DIR/.config/nvim/"
mkdir -p "$DOTS_DIR/.config/bspwm/"
mkdir -p "$DOTS_DIR/.config/sxhkd/"
mkdir -p "$DOTS_DIR/.shellcuts/data/"

cp "$HOME/.config/nvim/init.vim" "$DOTS_DIR/.config/nvim/" > /dev/null 2>&1
cp "$HOME/.config/bspwm/bspwmrc" "$DOTS_DIR/.config/bspwm/" > /dev/null 2>&1
cp "$HOME/.config/sxhkd/sxhkdrc" "$DOTS_DIR/.config/sxhkd/" > /dev/null 2>&1
cp "$HOME/.shellcuts/data/shellcuts.json" "$DOTS_DIR/.shellcuts/data/" > /dev/null 2>&1
