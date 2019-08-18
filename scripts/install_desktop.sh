#!/bin/sh
# Install all components of my desktop environment.
# Written by Tiger Sachse.

DOWNLOAD_PARTIAL_DIR="/tmp/download"
POLYBAR_VERSION="3.4.0"

if ! [ $(id -u) = 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

# Install Compton.
apt install compton

# Install BSPWM and SXHKD.
apt install -y \
    xcb \
    libxcb-util0-dev \
    libxcb-ewmh-dev \
    libxcb-randr0-dev \
    libxcb-icccm4-dev \
    libxcb-keysyms1-dev \
    libxcb-xinerama0-dev \
    libasound2-dev \
    libxcb-xtest0-dev \
    gcc \
    make \
    git

download_dir="${DOWNLOAD_PARTIAL_DIR}_$(date +%s)"
mkdir -p "$download_dir"
cd "$download_dir"

git clone https://github.com/baskerville/bspwm.git
cd bspwm
make
make install
cd ..

git clone https://github.com/baskerville/sxhkd.git
cd sxhkd
make
make install
cd ..

# Install Polybar.
apt install -y \
    git \
    cmake \
    gcc \
    python-xcbgen \
    libxcb-ewmh-dev \
    libxcb-icccm4-dev \
    libxcb1-dev \
    libxcb-xrm-dev \
    xcb-proto \
    libxcb-util-dev \
    libxcb-image0-dev \
    libxcb-randr0-dev \
    libxcb-xkb-dev \
    libalsaplayer-dev \
    wireless-tools \
    libcurlpp-dev \
    libcairo2-dev \
    libxcb-composite0-dev

download_dir="${DOWNLOAD_PARTIAL_DIR}_$(date +%s)"
mkdir -p "$download_dir"
cd "$download_dir"

wget "https://github.com/jaagr/polybar/releases/download/$POLYBAR_VERSION/polybar-$POLYBAR_VERSION.tar"
tar -xf "polybar-$POLYBAR_VERSION.tar"
cd polybar
mkdir build
cd build
cmake ..
make -j"$(nproc)"
make install
