# Install dots found in this repository.

DOTS_DIR="$HOME/.scripts/dots"

cp $DOTS_DIR/.face ~/
cp $DOTS_DIR/.hidden ~/
cp $DOTS_DIR/.bashrc ~/
cp $DOTS_DIR/.pylintrc ~/
cp $DOTS_DIR/.bash_aliases ~/
cp $DOTS_DIR/.bash_profile ~/

mkdir -p ~/.config/nvim
mkdir -p ~/.shellcuts/data
mkdir -p ~/.config/variety

cp $DOTS_DIR/.config/nvim/init.vim ~/.config/nvim/
cp $DOTS_DIR/.config/variety/variety.conf ~/.config/variety/
cp $DOTS_DIR/.shellcuts/data/shellcuts.json ~/.shellcuts/data/
