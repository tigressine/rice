#!/bin/sh
# Install some fun stuff.
# Written by Tiger Sachse.

DOWNLOAD_PARTIAL_DIR="/tmp/downloaded"
FORTUNES_DIR="/usr/share/games/fortunes"

if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

apt install -y fortune-mod cowsay lolcat screenfetch
/usr/bin/yes | pip3 install enigmamachine

download_dir="${DOWNLOAD_PARTIAL_DIR}_$(date +%s)"
mkdir -p "$download_dir"
cd "$download_dir"

git clone https://github.com/ruanyf/fortunes.git
mv fortunes/data/fortunes* "$FORTUNES_DIR"
