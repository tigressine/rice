# Minecraft installation script for Ubuntu
# Written by Tiger Sachse

SYS_EXECUTABLE="/usr/bin/minecraft"
DESKTOP_EXECUTABLE="~/Desktop/minecraft"

clear
echo "Welcome to Tgsachse's Minecraft Installation Script for Ubuntu."
echo
echo "Enter 1 to install Minecraft."
echo "Enter 0 or anything else to quit without installation."
read COMMAND

if [ "$COMMAND" != "1" ]; then
    echo "Quitting without installation..."
    exit 0
fi

# Install Java9
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install oracle-java9-installer oracle-java9-set-default

mkdir ~/.minecraft

# Download the Minecraft.jar
wget http://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar -P ~/.minecraft

echo "Minecraft downloaded."
echo
echo "Installation IS NOT complete!"
echo "Now you must log into the client, then go to your profiles (located in the bottom left corner"
echo "Under your default profile, you must enable java arguments. Then exit the client."
echo "Enter 1 to launch the client and then follow these instructions."
echo "Enter 0 or anything else to cancel installation."
read COMMAND

if [ "$COMMAND" != "1" ]; then
    echo "Cancelling installation..."
    exit 0
fi

# Run the jar
echo "java -jar ~/.minecraft/Minecraft.jar" | sudo tee $SYS_EXECUTABLE > /dev/null
sudo chmod +x $SYS_EXECUTABLE
minecraft

clear
echo "How much RAM (in gigabytes) would you like to allocate to Minecraft? Enter a value between 1 and 8 (default: 1)"
read RAM

# Change RAM allocation for default profile and remove poison pill java argument
if [ "$RAM" -ge 2 -a "$RAM" -le 8 ]; then
    sed -i "s/-Xmx1G/-Xmx"$RAM"G/" ~/.minecraft/launcher_profiles.json
fi
sed -i 's/ -XX:+CMSIncrementalMode / /' ~/.minecraft/launcher_profiles.json

# Add options for custom game directories
# Add options for modding
