# sPoNgEbOb.c installation script
# Written by Tiger Sachse
# sPoNgEbOb.c by Caleb Shepard

# Change this variable to change the name of the folder created during install
DOWNLOAD_FOLDER="/tmp/sponge_installation"

git clone https://github.com/Caleb-Shepard/Scripts.git $DOWNLOAD_FOLDER

cd $DOWNLOAD_FOLDER
sudo gcc Scripts_General/sources/sPoNgEbOb.c -o /usr/bin/sponge

if $?;
then
    echo "Something went wrong installing sPoNgEbOb."
    echo "Sorry. ;("
else
    # Dorky stuff to print at the end :P
    echo
    echo
    echo \#########################################################
    echo Installation Successful! Try this command to get started:
    echo \$ sponge \"who lives in a pineapple under the sea?\"
    echo
fi
