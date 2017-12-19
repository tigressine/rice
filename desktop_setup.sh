# Desktop installation script
install_dir='~/installation'

### SETUP ###
# Make installation directory
mkdir $install_dir

# Check that system is up to date
sudo apt update
sudo apt upgrade


### THEMES ###


### UTILITIES ###
# Install needed utilities
sudo apt install git neovim nautilus-dropbox tmux gnome-tweak-tool

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

# Install java9
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install oracle-java9-installer oracle-java9-set-default


### SOFTWARE ###
# Install Google Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable

# Install Discord
cd $install_dir
wget -O discord.deb https://discordapp.com/api/download?platform=linux&format=deb
sudo apt install libgconf-2-4 libc++1
sudo apt --fix-broken install
sudo dpkg -i discord.deb
