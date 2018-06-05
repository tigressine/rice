D_DOTS="$HOME/.scripts/dots"

cp $D_DOTS/.bashrc ~/
cp $D_DOTS/.bash_aliases ~/
cp $D_DOTS/.bash_profile ~/
cp $D_DOTS/.face ~/
cp $D_DOTS/.pylintrc ~/

mkdir -p ~/.config/nvim
mkdir -p ~/.config/shellcuts
mkdir -p ~/.config/variety
cp $D_DOTS/.config/nvim/init.vim ~/.config/nvim/
cp $D_DOTS/.config/shellcuts/shellcuts.db ~/.config/shellcuts/
cp $D_DOTS/.config/variety/variety.conf ~/.config/variety/
