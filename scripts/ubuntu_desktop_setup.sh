# Full desktop installation script for Ubuntu systems
# Written by Tiger Sachse

### SCRIPT DIRECTORY ###
D_SCRIPTS="$HOME/.scripts"

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
    echo
    echo "e.g. To install Discord, Google Chrome, and Java 10, enter \"kmo\""
    echo

    read COMMANDS
    LEN=${#COMMANDS}

    for ((i = 0; i < LEN; i++)); do
        case ${COMMANDS:$i:1} in
            a|A)
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
}

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
    sudo apt install -y neovim vpnc network-manager-vpnc tree zsh fish gcc
    sudo apt install -y fortune cowsay lolcat screenfetch
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
    mkdir $HOME/Bin $HOME/Slate
}

# Install dotfiles from GitHub
function install_dots {
    bash $D_SCRIPTS/dots/install_dots.sh
}

# Install icon theme, GTK theme and enable shell themes
function install_themes {
    sudo add-apt-repository ppa:tista/adapta
    sudo add-apt-repository ppa:papirus/papirus
    sudo apt update
    sudo apt install -y gnome-shell-extensions gnome-tweak-tool
    sudo apt install -y adapta-gtk-theme papirus-icon-theme
    sudo apt install -y chrome-gnome-shell
    gsettings set org.gnome.desktop.interface gtk-theme Adapta
    gsettings set org.gnome.desktop.interface icon-theme Papirus-Adapta
    echo
    echo "You'll need to restart and then use the tweak tool to change the shell theme."
    echo
}

# Install wallpaper manager
function install_variety { # ADD TO SWITCH
    sudo add-apt-repository ppa:peterlevi/ppa
    sudo apt update
    sudo apt install variety
}


### DEVELOPMENT TOOLS ###
# Install Java10
function install_java {
    sudo add-apt-repository ppa:linuxuprising/java
    sudo apt update
    sudo apt install -y oracle-java10-installer
}

# Install Python tools and projects
function install_python_tools {
    sudo apt install -y python3-pip
    /usr/bin/yes | sudo pip3 install selenium enigmamachine
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


### GAMING ###
# Install Discord
function install_discord {
    wget -O /tmp/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
    sudo apt install libgconf-2-4 libc++1
    sudo apt --fix-broken install
    sudo dpkg -i /tmp/discord.deb
}

# Install Minecraft
function install_minecraft {
    bash $D_INSTALL/scripts/install_minecraft.sh
}


# call the main function
#main

function check_installed {
    return command -v $1
}

echo $(check_installed "git")
echo $(check_installed "gitt")
