cp $HOME/.bashrc .
cp $HOME/.bash_aliases .
cp $HOME/.bash_profile .
cp $HOME/.face .
cp $HOME/.pylintrc .
cp $HOME/.hidden .

mkdir -p .shellcuts/data
mkdir -p .config/nvim
mkdir -p .config/variety
cp $HOME/.config/nvim/init.vim .config/nvim/
cp $HOME/.shellcuts/data/shellcuts.json .shellcuts/data
cp $HOME/.config/variety/variety.conf .config/variety
