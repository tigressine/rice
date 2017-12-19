# This script was written to install League of Legends on Ubuntu.
# It currently does not work, although I may return to finish it in the future.
# It was created to automate the clearest guide I found on reddit.

install_dir='install_league'
prefix_dir='~/.LoL64'

mkdir $install_dir
cd $install_dir

sudo dpkg --add-architecture i386

# Install wine
wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
sudo apt update
sudo apt install --install-recommends winehq-staging

# Install winetricks and cabextract
wget -nc https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
sudo apt install cabextract

# Create prefix, install directX, and run configuration
WINEPREFIX=$prefix_dir WINEARCH=win32 wine winecfg
WINEPREFIX=$prefix_dir ./winetricks d3dx9
WINEPREFIX=$prefix_dir wine winecfg

# At this point there are options you need to tweak in winecfg

# Need to download LeageOfLegendsBaseNA.exe
# Final installation
WINEPREFIX=$prefix_dir wine LeagueOfLegendsBaseNA.exe
WINEPREFIX=$prefix_dir wine C:/Riot\ Games/League\ of\ Legends/lol.launcher.exe
WINEPREFIX=$prefix_dir wine C:/Riot\ Games/League\ of\ Legends/LeagueClient.exe
