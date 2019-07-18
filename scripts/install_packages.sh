# Installation functions for many of the programs and systems I use on.
# Written by Tiger Sachse.

DOWNLOAD_PARTIAL_DIR="/tmp/downloaded"
BUNDLE_DIR="$HOME/.config/nvim/bundle"
FORTUNES_DIR="/usr/share/games/fortunes"

install_workflow() {
    sudo apt install -y neovim git tree gcc g++

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


    #cd
    git clone https://www.github.com/tgsachse/rice.git
    sh rice/dots/install_dots.sh

    # Configure Neovim.
    git clone https://github.com/VundleVim/Vundle.vim.git "$BUNDLE_DIR"
    neovim +PluginInstall +qall
}

install_languages() {
    sudo apt install -y python3-pip golang-go

    sudo add-apt-repository -y ppa:linuxuprising/java
    sudo apt update
    sudo apt install -y oracle-java11-installer

    sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt update
    sudo apt install -y oracle-java8-installer oracle-java8-set-default
}

install_toys() {
    sudo apt install -y fortune-mod cowsay lolcat screenfetch
    /usr/bin/yes | sudo pip3 install enigmamachine

    download_dir="${DOWNLOAD_PARTIAL_DIR}_$(date +%s)"
    mkdir -p "$download_dir"
    cd "$download_dir"

    git clone https://github.com/caleb-shepard/scripts.git
    sudo gcc scripts_general/sources/spongebob.c -o /usr/bin/sponge

    git clone https://github.com/ruanyf/fortunes.git
    sudo mv fortunes/data/fortunes* "$FORTUNES_DIR"

    cd "$FORTUNES_DIR"
    sudo strfile % fortunes fortunes.dat
}

install_plank() {
    sudo add-apt-repository -y ppa:docky-core/stable
    sudo apt-get update
    sudo apt-get install -y plank
}

install_variety() {
    sudo add-apt-repository -y ppa:peterlevi/ppa
    sudo apt update
    sudo apt install -y variety
}

install_slack() {
    sudo apt install -y snapd
    sudo snap install -y slack --classic
}

install_libreoffice() {
    sudo apt install -y libreoffice
}

install_vlc() {
    sudo apt install -y vlc
}

install_chrome() {
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | \
        sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt update
    sudo apt install -y google-chrome-stable
}

install_chromium() {
    sudo snap install chromium
}

install_dropbox() {
    sudo apt install -y nautilus-dropbox
    dropbox autostart y
}

install_gimp() {
    sudo apt install -y gimp
}
