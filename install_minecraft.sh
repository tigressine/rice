# Install Minecraft

# Install Java9
sudo add-apt-repository ppa:webupd8team/java
sudo apt update
sudo apt install oracle-java9-installer oracle-java9-set-default

# Install & Run Minecraft
mkdir ~/.minecraft
cd ~/.minecraft
wget s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
java -jar Minecraft.jar


echo
echo
echo "You now must log in, then go to your profiles and on your firs
#sed 's/-Xmx1G/-Xmx4G/' launcher_profiles.json > temp.json
#sed 's/ -XX:+CMSIncrementalMode / /' temp.json > launcher_profiles.json
#rm temp.json
# Possibly add more to put versions in own folder like usual
# possibly add modded stuff
