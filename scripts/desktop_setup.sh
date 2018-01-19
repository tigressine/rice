# Desktop installation script for Kubuntu
# Written by Tiger Sachse
install_dir="~/installation"
dotfile_dir="~/.git_dotfiles"

### SETUP ###
# Make installation directory
mkdir $install_dir

# Clone necessary script repository
git clone https://www.github.com/tgsachse/scripts.git $install_dir

# Check that system is up to date
sudo apt update
sudo apt upgrade


### UTILITIES ###
# Install useful terminal utilities
sudo apt install git neovim

# Install packages for UCF VPN
sudo apt install vpnc network-manager-vpnc

# Install other goofy stuff
sudo apt install fortune cowsay lolcat
.$install_dir/scripts/scripts/install_sponge.sh


### CUSTOMIZATION ###
# Install dotfiles from GitHub
git clone https://www.github.com/tgsachse/dotfiles.git $dotfile_dir
.$dotfile_dir/install.sh

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
sudo pip3 install selenium enigmamachine


### SOFTWARE ###
# Install Google Chrome
cd $install_dir
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable

# Install Dropbox
sudo apt install nautilus-dropbox
dropbox autostart y

### GAMING ###
# Install Discord
cd $install_dir
wget -O discord.deb https://discordapp.com/api/download?platform=linux&format=deb
sudo apt install libgconf-2-4 libc++1
sudo apt --fix-broken install
sudo dpkg -i discord.deb

# Install Minecraft
.$install_dir/scripts/scripts/install_minecraft.sh


### CLEANUP ###
rm -r $install_dir
