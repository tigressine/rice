# Installation functions for many of the programs and
# systems I use on my main machine.

SCRIPTS_DIR="$HOME/.scripts"

## Tasks
# Add installation process for mouse theme
# Make Plank auto startup

#### LOOK AND FEEL ####
# Install Plank
function install_plank {
    sudo add-apt-repository -y ppa:docky-core/stable
    sudo apt-get update
    sudo apt-get install -y plank
}

# Install GNOME theme
function install_theme {
    sudo add-apt-repository -y ppa:tista/adapta ppa:papirus/papirus
    sudo apt update
    sudo apt install -y gnome-shell-extensions gnome-tweak-tool adapta-gtk-theme \
        papirus-icon-theme chrome-gnome-shell
    gsettings set org.gnome.desktop.interface gtk-theme Adapta
    gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark
    gnome-shell-extension-tool -e user-theme@gnome-shell-extensions.gcampax.github.com
    gnome-shell --replace 2>/dev/null 1>&2 &
    gsettings set org.gnome.shell.extensions.user-theme name Adapta-Eta
}

# Install Variety
function install_variety {
    sudo add-apt-repository -y ppa:peterlevi/ppa
    sudo apt update
    sudo apt install -y variety
}

# Install Base16 for the shell
function install_base16_shell {
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
}

# Install Tigerseye colorscheme
function install_tigerseye {
    INSTALL_DIR="/tmp/tigerseye"
    rm -rf $INSTALL_DIR 
    
    git clone https://www.github.com/tgsachse/tigerseye.git $INSTALL_DIR

    cd $INSTALL_DIR/scripts
    bash installTemplates.sh
    cd -
}

# Install personal dotfiles
function install_dots {
    git clone https://www.github.com/tgsachse/scripts $SCRIPTS_DIR
    bash $SCRIPTS_DIR/dots/install_dots.sh
}

# Install Base16 Builder
function install_base16_builder {
    sudo apt install -y npm
    sudo npm install --global base16-builder
}

# Enable UFW firewall
function enable_firewall {
    sudo ufw enable
}

# Configure home directory
function configure_home_directory {
    rm -r $HOME/Music $HOME/Pictures $HOME/Public $HOME/Downloads \
        $HOME/Templates $HOME/Videos $HOME/Desktop $HOME/Documents
    mkdir $HOME/Slate
}


#### DEVELOPMENT TOOLS ####
# Install and configure Git
function install_git {
    sudo apt install git -y

    echo "Enter email for git:"
    read EMAIL
    echo "Enter full name for git:"
    read NAME

    git config --global user.email $EMAIL
    git config --global user.name $NAME
}

# Install terminal utilities
function install_terminal_utils {
    sudo apt install -y tree gcc fortune cowsay lolcat screenfetch
}

# Install Shells
function install_shells {
    sudo apt install -y zsh fish ksh
}

# Install and configure Neovim
function install_nvim {
    sudo apt install -y neovim
    install_dots
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
    vim +PluginInstall +qall
}

# Install Shellcuts
function install_shellcuts {
    cd /tmp && wget https://github.com/tgsachse/shellcuts/archive/v1.2.3.tar.gz
    tar -xzf v1.2.3.tar.gz && cd shellcuts-1.2.3
    python3 install.py
}

# Install Slack
function install_slack {
    sudo apt install snapd
    sudo snap install slack --classic
}

# Install Java11
function install_java11 {
    sudo add-apt-repository -y ppa:linuxuprising/java
    sudo apt update
    sudo apt install -y oracle-java11-installer oracle-java11-set-default
}

# Install Java8
function install_java8 {
    sudo add-apt-repository -y ppa:webupd8team/java
    sudo apt update
    sudo apt install -y oracle-java8-installer oracle-java8-set-default
}

# Install pip3
function install_pip3 {
    sudo apt install -y python3-pip    
}

# Install Selenium
function install_selenium {
    /usr/bin/yes | sudo pip3 install selenium
}

# Install Golang
function install_golang {
    sudo apt install -y golang-go
}


#### UTILITIES/FUN ####
# Install VPN packages
function install_vpn {
    sudo apt install -y vpnc network-manager-vpnc network-manager-vpnc-gnome
}

# Install SpOnGe
function install_sponge {
    INSTALL_DIR="/tmp/sponge"
    sudo rm -rf $INSTALL_DIR

    git clone https://github.com/Caleb-Shepard/Scripts.git $INSTALL_DIR

    cd $INSTALL_DIR
    sudo gcc Scripts_General/sources/sPoNgEbOb.c -o /usr/bin/sponge
    cd -
}

# Install Engima
function install_enigma {
    /usr/bin/yes | sudo pip3 install enigmamachine
}


#### LARGE PROGRAMS ####
# Install LibreOffice
function install_libreoffice {
    sudo apt install -y libreoffice
}

# Install VLC
function install_vlc {
    sudo apt install -y vlc
}

# Install Google Chrome
function install_chrome {
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | \
        sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt update
    sudo apt install -y google-chrome-stable
}

# Install Dropbox
function install_dropbox {
    sudo apt install -y nautilus-dropbox
    dropbox autostart y
}

# Install GIMP
function install_gimp {
    sudo apt install -y gimp
}

# Install Discord
function install_discord {
    wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
    sudo apt install -y libatomic1 libgconf-2-4 libc++1
    sudo apt --fix-broken install
    sudo dpkg -i /tmp/discord.deb
}


#### BEGINNING OF EXECUTION ####
for ARGUMENT in "$@"
do
    case $ARGUMENT in
        chrome) install_chrome;;
        plank) install_plank;;
        theme) install_theme;;
        variety) install_variety;;
        base16-shell) install_base16_shell;;
        tigerseye) install_tigerseye;;
        dots) install_dots;;
        base16-builder) install_base16_builder;;
        firewall) enable_firewall;;
        home) configure_home_directory;;
        git) install_git;;
        terminal-utils) install_terminal_utils;;
        shells) install_shells;;
        nvim) install_nvim;;
        shellcuts) install_shellcuts;;
        java8) install_java8;;
        java11) install_java11;;
        pip3) install_pip3;;
        selenium) install_selenium;;
        golang) install_golang;;
        sponge) install_sponge;;
        enigma) install_enigma;;
        libreoffice) install_libreoffice;;
        vlc) install_vlc;;
        chrome) install_chrome;;
        dropbox) install_dropbox;;
        gimp) install_gimp;;
        discord) install_discord;;
    esac
done
