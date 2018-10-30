# Update the dots located in this repository.

cp $HOME/.face .
cp $HOME/.hidden .
cp $HOME/.bashrc .
cp $HOME/.pylintrc .
cp $HOME/.bash_aliases .
cp $HOME/.bash_profile .

mkdir -p .config/nvim
mkdir -p .config/variety
mkdir -p .shellcuts/data

cp $HOME/.config/nvim/init.vim .config/nvim/
cp $HOME/.config/variety/variety.conf .config/variety
cp $HOME/.shellcuts/data/shellcuts.json .shellcuts/data
