# sPoNgEbOb.c installation script
# Written by Tiger Sachse
# sPoNgEbOb.c by Caleb Shepard

# Change this variable to change the name of the folder created during install
D_INSTALL="/tmp/sponge_installation"

sudo rm -r $D_INSTALL
git clone https://github.com/Caleb-Shepard/Scripts.git $D_INSTALL

cd $D_INSTALL
sudo gcc Scripts_General/sources/sPoNgEbOb.c -o /usr/bin/sponge

# Dorky stuff to print at the end :P
echo
echo
echo \#########################################################
echo Installation Successful! Try this command to get started:
echo \$ sponge \"who lives in a pineapple under the sea?\"
echo
