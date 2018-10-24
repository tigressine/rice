# Full desktop installation script for Ubuntu systems
# Written by Tiger Sachse 

### SCRIPT DIRECTORY ###
D_SCRIPTS="$HOME/.scripts"

# TODO
# Add script to install Slack, vlc, libreoffice
# Remove some old artifacts from this script
# Add plank, remove ubuntu dock

### SETUP ###
# install git to clone the scripts repo
function install_git {
    sudo apt install git -y

    echo "Enter email for git:"
    read EMAIL
    echo "Enter full name for git:"
    read NAME

    git config --global user.email $EMAIL
    git config --global user.name $NAME
}

# Clone script repository
function download_scripts {
    if [ -d $D_SCRIPTS ];
    then
        sudo rm -r $D_SCRIPTS
    fi
    git clone https://www.github.com/tgsachse/scripts.git $D_SCRIPTS
}

# Check that system is up to date
function update_system {
    sudo apt update
    sudo apt upgrade -y
}


### UTILITIES ###
# Install useful terminal utilities, UCF VPN, and goofy stuff
function install_utilities {
    sudo apt install -y vpnc network-manager-vpnc network-manager-vpnc-gnome
    sudo apt install -y neovim tree zsh fish ksh gcc
    sudo apt install -y fortune cowsay lolcat screenfetch
}

# Install and configure neovim
function install_nvim {
    sudo apt install -y neovim
    /usr/bin/yes | sudo pip3 install pylint
    install_dots
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
    vim +PluginInstall +qall
}

# Install shellcuts utility
function install_shellcuts {
    cd /tmp && wget https://github.com/tgsachse/shellcuts/archive/v1.2.3.tar.gz
    tar -xzf v1.2.3.tar.gz && cd shellcuts-1.2.3
    python3 install.py
}

# Run SpOnGe install script
function install_sponge {
    bash $D_SCRIPTS/scripts/install_sponge.sh
}

# Enable UFW firewall
function enable_firewall {
    sudo ufw enable
}


### CUSTOMIZATION ###
# Configure home directory
function configure_home_directory {
    rm -r $HOME/Music $HOME/Pictures $HOME/Public
    rm -r $HOME/Downloads $HOME/Templates $HOME/Videos
    rm -r $HOME/Desktop $HOME/Documents
    mkdir $HOME/Slate
}

# Install dotfiles from GitHub
function install_dots {
    bash $D_SCRIPTS/dots/install_dots.sh
}

# Install icon theme, GTK theme and enable shell themes
function install_themes {
    sudo add-apt-repository -y ppa:tista/adapta
    sudo add-apt-repository -y ppa:papirus/papirus
    sudo apt update
    sudo apt install -y gnome-shell-extensions gnome-tweak-tool
    sudo apt install -y adapta-gtk-theme papirus-icon-theme
    sudo apt install -y chrome-gnome-shell
    gsettings set org.gnome.desktop.interface gtk-theme Adapta
    gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark
    gnome-shell-extension-tool -e user-theme@gnome-shell-extensions.gcampax.github.com
    gnome-shell --replace 2>/dev/null 1>&2 &
    gsettings set org.gnome.shell.extensions.user-theme name Adapta-Eta
}

# Run script for all system settings
function set_system_settings {
    bash $D_SCRIPTS/scripts/set_system_settings.sh 
}

# Install wallpaper manager
function install_variety {
    sudo add-apt-repository -y ppa:peterlevi/ppa
    sudo apt update
    sudo apt install -y variety
}

# Install Dash to Dock
function install_dash_to_dock {
    MAKE_DIR="/tmp/dash-to-dock"
    rm -rf $MAKE_DIR
    git clone https://www.github.com/micheleg/dash-to-dock.git $MAKE_DIR
    make -C $MAKE_DIR
    make -C $MAKE_DIR install
    gnome-shell --replace 2>/dev/null 1>&2 &
    gnome-shell-extension-tool -e dash-to-dock@micxgx.gmail.com
    sudo apt remove -y gnome-shell-extension-ubuntu-dock
}

# Install Base16 for the Bash shell
function install_base16_shell {
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
}

# Install tigerseye colorscheme for shell and vim
function install_tigerseye {
    TEMP_DIR="/tmp/tigerseye"
    CURRENT_DIR="$(pwd)"
    rm -rf $TEMP_DIR 
    git clone https://www.github.com/tgsachse/tigerseye.git $TEMP_DIR
    cd $TEMP_DIR/scripts
    bash installTemplates.sh
    cd $CURRENT_DIR
}


### DEVELOPMENT TOOLS ###
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
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt update
    sudo apt install -y oracle-java8-installer oracle-java11-set-default
}

# Install Python tools and projects
function install_python_tools {
    sudo apt install -y python3-pip
    /usr/bin/yes | sudo pip3 install selenium enigmamachine
}

# Install Golang
function install_golang {
    sudo apt install -y golang-go
}

# Install NPM and Base16 builder
function install_npm {
    sudo apt install -y npm
    sudo npm install --global base16-builder
}


### SOFTWARE ###
# Install Google Chrome
function install_chrome {
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
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


### GAMING ###
# Install Discord
function install_discord {
    wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
    sudo apt install -y libatomic1 libgconf-2-4 libc++1
    sudo apt --fix-broken install
    sudo dpkg -i /tmp/discord.deb
}

# Install Minecraft
function install_minecraft {
    # needs to be investigated
    bash $D_INSTALL/scripts/install_minecraft.sh
}
