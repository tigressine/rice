# Update the dots located in this repository.
# Written by Tiger Sachse.
cp $HOME/.face .
cp $HOME/.bashrc .
cp $HOME/.tmux.conf .
cp $HOME/.Xresources .
cp $HOME/.bash_profile .
cp $HOME/.bashrc_simple .
cp $HOME/.shell_aliases .

mkdir -p .config/nvim
mkdir -p .config/variety
mkdir -p .shellcuts/data

cp $HOME/.config/nvim/init.vim .config/nvim/
cp $HOME/.config/variety/variety.conf .config/variety/
cp $HOME/.shellcuts/data/shellcuts.json .shellcuts/data/
