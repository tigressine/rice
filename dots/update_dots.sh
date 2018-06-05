cp $HOME/.bashrc .
cp $HOME/.bash_aliases .
cp $HOME/.bash_profile .
cp $HOME/.face .
cp $HOME/.pylintrc .

mkdir -p .config/nvim
mkdir -p .config/shellcuts
mkdir -p .config/variety
cp $HOME/.config/nvim/init.vim .config/nvim/
cp $HOME/.config/shellcuts/shellcuts.db .config/shellcuts
cp $HOME/.config/variety/variety.conf .config/variety
