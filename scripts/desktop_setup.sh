# Desktop installation script for Kubuntu
# Written by Tiger Sachse
install_dir='~/installation'

### SETUP ###
# Make installation directory
mkdir $install_dir
cp scripts/install_sponge.sh $install_dir
cp scripts/install_minecraft.sh $install_dir

# Check that system is up to date
sudo apt update
sudo apt upgrade


### UTILITIES ###
# Install needed utilities
sudo apt install git neovim tmux plank fortune cowsay lolcat
./install_sponge.sh

# Install dotfiles from github
cd $install_dir
git clone https://www.github.com/tgsachse/dotfiles.git
cd dotfiles
chmod +x install.sh
./install.sh


### DEVELOPMENT ###
# Install Python tools and projects
sudo apt install python3-pip
sudo pip3 install selenium enigmamachine


### SOFTWARE ###
# Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable

# Install Dropbox
cd ~ && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -


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
