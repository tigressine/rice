#!/bin/sh
# Install programming languages that I commonly use.
# Written by Tiger Sachse.

if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Install shipping tools.
apt install -y git python3-pip make cmake

# Install various languages.
apt install -y golang-go gcc g++
snap install --classic kotlin
add-apt-repository -y ppa:linuxuprising/java
apt update
apt install -y oracle-java12-installer
