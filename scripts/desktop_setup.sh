# Desktop installation script for Kubuntu
# Written by Tiger Sachse

function procedure_check {
    echo
    echo "Next process: $1"
    echo "Proceed? (Yes/No/Skip)"
    
    read command
    
    case $command in
        Y|y|yes|Yes)
            echo "Proceeding..."
            return 0
            ;;
        N|n|no|No)
            echo "Goodbye!"
            exit 0
            ;;
        S|s|skip|Skip)
            echo "Skipping..."
            return 1
            ;;
        *)
            echo "Goodbye!"
            exit 0
            ;;
    esac
}

install_dir="~/installation"

### SETUP ###
# Make installation directory
if procedure_check "make installation directory";
then
    echo "running"
    #mkdir $install_dir
    #cp install_sponge.sh $install_dir
    #cp install_minecraft.sh $install_dir
    #cd $install_dir
fi

exit 0

# Check that system is up to date
sudo apt update
sudo apt upgrade


### UTILITIES ###
# Install useful terminal utilities
sudo apt install git neovim tmux

# Install packages for UCF VPN
sudo apt install vpnc network-manager-vpnc

# Install other goofy stuff
sudo apt install fortune cowsay lolcat
./install_sponge.sh


### CUSTOMIZATION ###
# Install dotfiles from GitHub
git clone https://www.github.com/tgsachse/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh

# Install Plank
sudo apt install plank


### DEVELOPMENT ###
# Install Java9
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install oracle-java9-installer oracle-java9-set-default

# Install C compiler
sudo apt install gcc

# Install Python tools and projects
sudo apt install python3-pip
sudo pip3 install selenium enigmamachine shellcuts


### SOFTWARE ###
# Install Google Chrome
cd $install_dir
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable

# Install Dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -
ln -s .dropbox-dist/dropboxd .kde/Autostart/dropboxd
.dropbox-dist/dropboxd


### GAMING ###
# Install Discord
cd $install_dir
wget -O discord.deb https://discordapp.com/api/download?platform=linux&format=deb
sudo apt install libgconf-2-4 libc++1
sudo apt --fix-broken install
sudo dpkg -i discord.deb

# Install Minecraft
./install_minecraft.sh


### CLEANUP ###
rm -r $install_dir
