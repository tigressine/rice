#!/bin/sh
# Install programming languages that I commonly use.
# Written by Tiger Sachse.

if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

apt install -y python3-pip golang-go gcc g++

add-apt-repository -y ppa:linuxuprising/java
apt update
apt install -y oracle-java11-installer

add-apt-repository -y ppa:webupd8team/java
apt update
apt install -y oracle-java8-installer oracle-java8-set-default
