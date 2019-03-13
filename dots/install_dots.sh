# Install dots found in this repository.
# Written by Tiger Sachse.
cp .face $HOME/
cp .bashrc $HOME/
cp .Xresources $HOME/
cp .bash_profile $HOME/
cp .shell_aliases $HOME/

mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/variety
mkdir -p $HOME/.shellcuts/data

cp .config/nvim/init.vim $HOME/.config/nvim/
cp .config/variety/variety.conf $HOME/.config/variety/
cp .shellcuts/data/shellcuts.json $HOME/.shellcuts/data/
