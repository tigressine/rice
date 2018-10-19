# Full desktop installation script for Ubuntu systems
# Written by Tiger Sachse 

### SCRIPT DIRECTORY ###
D_SCRIPTS="$HOME/.scripts"

# TODO
# Add script to install Slack, vlc, libreoffice
# Remove some old artifacts from this script
# Add plank, remove ubuntu dock

### GENERAL FUNCTIONS ###
# Entry point of the script
function main {
    echo "Welcome to Tgsachse's installation script for Ubuntu."
    echo
    echo "Below is a list of functions this script provides. Enter the letter"
    echo "or letters next to the functions you would like to run. You do not need"
    echo "to separate the letters."
    echo
    echo "a) run all the functions"
    echo "b) install git"
    echo "c) initialize script"
    echo "d) update system"
    echo "e) install utilities and fun stuff"
    echo "f) install SpOnGe"
    echo "g) enable UFW firewall"
    echo "h) clean up home directory"
    echo "i) install dots"
    echo "j) install icon, GTK, and shell themes"
    echo "k) install Java 10"
    echo "l) install pip for Python3, and Python projects"
    echo "m) install Google Chrome"
    echo "n) install and enable Dropbox"
    echo "o) install Discord"
    echo "p) install Minecraft"
    echo "q) quit"
    echo "r) install Shellcuts"
    echo "s) install Variety"
    echo "t) install GIMP"
    echo "u) set system settings"
    echo "v) install Golang"
    echo "w) install Dash to Dock"
    echo "x) install and configure neovim"
    echo "y) install npm and utilities"
    echo "z) install Base16 shell" 
    echo "A) install tigerseye colorscheme"
    echo
    echo "e.g. To install Discord, Google Chrome, and Java 10, enter \"kmo\""
    echo

    read COMMANDS
    LEN=${#COMMANDS}

    for ((i = 0; i < LEN; i++)); do
        case ${COMMANDS:$i:1} in
            a)
                run_all
                break
                ;;
            b|B)
                install_git
                ;;
            c|C)
                download_scripts
                ;;
            d|D)
                update_system
                ;;
            e|E)
                install_utilities
                ;;
            f|F)
                install_sponge
                ;;
            g|G)
                enable_firewall
                ;;
            h|H)
                configure_home_directory
                ;;
            i|I)
                install_dots
                ;;
            j|J)
                install_themes
                ;;
            k|K)
                install_java
                ;;
            l|L)
                install_python_tools
                ;;
            m|M)
                install_chrome
                ;;
            n|N)
                install_dropbox
                ;;
            o|O)
                install_discord
                ;;
            p|P)
                install_minecraft
                ;;
            q|Q)
                exit
                ;;
            r|R)
                install_shellcuts
                ;;
            s|S)
                install_variety
                ;;
            t|T)
                install_gimp
                ;;
            u|U)
                set_system_settings
                ;;
            v|V)
                install_golang
                ;;
            w|W)
                install_dash_to_dock
                ;;
            x|X)
                install_nvim
                ;;
            y|Y)
                install_npm
                ;;
            z|Z)
                install_base16_shell
                ;;
            A)
                install_tigerseye
                ;;
        esac
    done
}

# run all other functions
function run_all {
    install_git
    download_scripts
    update_system
    install_utilities
    install_sponge
    enable_firewall
    configure_home_directory
    install_dots
    install_themes
    install_java
    install_python_tools
    install_chrome
    install_dropbox
    install_discord
    install_minecraft
    set_system_settings
    install_golang
    install_dash_to_dock
    install_nvim
    install_npm
    install_base16_shell
    install_tigerseye
}

### SETUP ###
# install git to clone the scripts repo
function install_git {
    # DEPENDS: apt
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
    # DEPENDS: git
    if [ -d $D_SCRIPTS ];
    then
        sudo rm -r $D_SCRIPTS
    fi
    git clone https://www.github.com/tgsachse/scripts.git $D_SCRIPTS
}

# Check that system is up to date
function update_system {
    # DEPENDS: apt
    sudo apt update
    sudo apt upgrade -y
}


### UTILITIES ###
# Install useful terminal utilities, UCF VPN, and goofy stuff
function install_utilities {
    # DEPENDS: apt
    sudo apt install -y vpnc network-manager-vpnc network-manager-vpnc-gnome
    sudo apt install -y neovim tree zsh fish gcc
    sudo apt install -y fortune cowsay lolcat screenfetch
}

# Install and configure neovim
function install_nvim {
    # DEPENDS: apt, dotfiles, pip3, git

    sudo apt install -y neovim
    /usr/bin/yes | sudo pip3 install pylint
    install_dots
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
    vim +PluginInstall +qall
}

# Install shellcuts utility
function install_shellcuts {
    # DEPENDS: wget, dpkg, Python3
    LINK="https://github.com/tgsachse/shellcuts/releases/download/v1.2.1/shellcuts.deb"
    wget $LINK -P /tmp
    sudo dpkg -i /tmp/shellcuts.deb
}

# Run SpOnGe install script
function install_sponge {
    # DEPENDS: GCC, git
    bash $D_SCRIPTS/scripts/install_sponge.sh
}

# Enable UFW firewall
function enable_firewall {
    # DEPENDS: ufw
    sudo ufw enable
}


### CUSTOMIZATION ###
# Configure home directory
function configure_home_directory {
    rm -r $HOME/Music $HOME/Pictures $HOME/Public
    rm -r $HOME/Downloads $HOME/Templates $HOME/Videos
    rm -r $HOME/Desktop $HOME/Documents
    mkdir $HOME/Bin $HOME/Slate
}

# Install dotfiles from GitHub
function install_dots {
    bash $D_SCRIPTS/dots/install_dots.sh
}

# Install icon theme, GTK theme and enable shell themes
function install_themes {
    # DEPENDS: apt, gsettings, gnome-shell
    sudo add-apt-repository -y ppa:tista/adapta
    sudo add-apt-repository -y ppa:papirus/papirus
    sudo apt update
    sudo apt install -y gnome-shell-extensions gnome-tweak-tool
    sudo apt install -y adapta-gtk-theme papirus-icon-theme
    sudo apt install -y chrome-gnome-shell
    gsettings set org.gnome.desktop.interface gtk-theme Adapta
    gsettings set org.gnome.desktop.interface icon-theme Papirus-Adapta
    gnome-shell-extension-tool -e user-theme@gnome-shell-extensions.gcampax.github.com
    gnome-shell --replace 2>/dev/null 1>&2 &
    gsettings set org.gnome.shell.extensions.user-theme name Adapta-Eta
}

# Run script for all system settings
function set_system_settings {
    # TO BE REVAMPED
    bash $D_SCRIPTS/scripts/set_system_settings.sh 
}

# Install wallpaper manager
function install_variety {
    # DEPENDS: apt
    sudo add-apt-repository -y ppa:peterlevi/ppa
    sudo apt update
    sudo apt install -y variety
}

# Install Dash to Dock
function install_dash_to_dock {
    # DEPENDS: git, gnome-shell, gnome-shell-extension-tool, GCC (probably)
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
    # DEPENDS: git
    # Assumes required bashrc and vimrc lines already exist
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
}

# Install tigerseye colorscheme for shell and vim
function install_tigerseye {
    # DEPENDS git, bash, base16-shell, base16-vim
    TEMP_DIR="/tmp/tigerseye"
    CURRENT_DIR="$(pwd)"
    rm -rf $TEMP_DIR 
    git clone https://www.github.com/tgsachse/tigerseye.git $TEMP_DIR
    cd $TEMP_DIR/scripts
    bash installTemplates.sh
    cd $CURRENT_DIR
}


### DEVELOPMENT TOOLS ###
# Install Java10
function install_java {
    # DEPENDS: apt
    sudo add-apt-repository -y ppa:linuxuprising/java
    sudo apt update
    sudo apt install -y oracle-java10-installer
}

# Install Python tools and projects
function install_python_tools {
    # DEPENDS: python3
    sudo apt install -y python3-pip
    /usr/bin/yes | sudo pip3 install selenium enigmamachine
}

# Install Golang
function install_golang {
    # DEPENDS: apt
    sudo apt install -y golang-go
}

# Install NPM and Base16 builder
function install_npm {
    # DEPENDS: apt
    sudo apt install -y npm
    sudo npm install --global base16-builder
}


### SOFTWARE ###
# Install Google Chrome
function install_chrome {
    # DEPENDS: apt, wget
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt update
    sudo apt install -y google-chrome-stable
}

# Install Dropbox
function install_dropbox {
    # DEPENDS apt
    # Launch dropbox to complete installation?
    sudo apt install -y nautilus-dropbox
    dropbox autostart y
}

# Install GIMP
function install_gimp {
    # DEPENDS apt
    sudo apt install -y gimp
}


### GAMING ###
# Install Discord
function install_discord {
    # DEPENDS: wget, apt, dpkg
    wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
    sudo apt install -y libgconf-2-4 libc++1
    sudo apt --fix-broken install
    sudo dpkg -i /tmp/discord.deb
}

# Install Minecraft
function install_minecraft {
    # needs to be investigated
    bash $D_INSTALL/scripts/install_minecraft.sh
}

# call the main function
main
