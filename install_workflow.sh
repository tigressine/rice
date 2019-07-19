#!/bin/sh
# Install my workflow.
# Written by Tiger Sachse.

DOWNLOAD_PARTIAL_DIR="/tmp/downloaded"
BUNDLE_DIR="$HOME/.config/nvim/bundle"

sudo apt install -y neovim git tree

sudo add-apt-repository ppa:malteworld/ppa
sudo apt update
sudo apt install -y pdftk

# Configure Git.
echo "Enter email for git:"
read email
echo "Enter full name for git:"
read name
git config --global user.name "$name"
git config --global user.email "$email"

# Create a download directory.
download_dir="${DOWNLOAD_PARTIAL_DIR}_$(date +%s)"
mkdir -p "$download_dir"

# Download and install Shellcuts.
cd "$download_dir"
repo_dir="shellcuts"
git clone https://www.github.com/tgsachse/shellcuts.git "$repo_dir"
cd "$repo_dir"
python3 install.py

# Configure Neovim.
git clone https://github.com/VundleVim/Vundle.vim.git "$BUNDLE_DIR"
neovim +PluginInstall +qall
