# Install dots found in this repository.
# Written by Tiger Sachse.
cp .vimrc $HOME/
cp .bash_profile $HOME/
cp .shell_aliases $HOME/

# If a simple installation is requested, only copy the
# simple version of the Bash configuration, else copy
# everything.
if [ "$1" == "--simple" ]; then
    cp .bashrc_simple $HOME/.bashrc
else
    cp .face $HOME/
    cp .bashrc $HOME/
    cp .Xresources $HOME/
    cp .bashrc_simple $HOME/

    mkdir -p $HOME/.config/nvim
    mkdir -p $HOME/.config/variety
    mkdir -p $HOME/.shellcuts/data

    cp .config/nvim/init.vim $HOME/.config/nvim/
    cp .config/variety/variety.conf $HOME/.config/variety/
    cp .shellcuts/data/shellcuts.json $HOME/.shellcuts/data/
fi
