#'script' to install league bb

#add 32 bit architecture
sudo dpkg --add-architecture i386

#install special version of wine
wget -nc https://dl.winehq.org/wine-builds/Release.key
sudo apt-key add Release.key
sudo apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/
sudo apt-get update
sudo apt-get install --install-recommends winehq-staging

#install winetricks
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
sudo apt install cabextract

WINEPREFIX=~/.LoL32 WINEARCH=win32 wine winecfg
WINEPREFIX=~/.LoL32 ./winetricks d3dx9
WINEPREFIX=~/.LoL32 wine winecfg

#mess with settings
echo "Time to mess with some settings fam. Change Windows version to Windows XP."
echo "Now click on the graphics tab and enable 'automatically capture mouse in full screen windows."
echo "Enable 'emulate a virtual desktop' and set the resolution to the resolution of the monitor you want to display the game on"
echo "Click on the staging tab and enable CSMT"
echo "Click on the libraries tab and use the 'New override for libraries' text box to add the override 'msvcp140'"
echo "Apply and hit OK"
echo "Finally execute the second script"
