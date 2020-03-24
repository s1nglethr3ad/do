#!/bin/bash
echo "SYSTEM UPDATE"
export DEBIAN_FRONTEND=noninteractive
add-apt-repository universe
sleep 5
apt-get -y update
sleep 30
apt-get upgrade -yq
sleep 30
apt-get -y dist-upgrade
sleep 30
apt-get install -y postfix
wget https://github.com/gophish/gophish/releases/download/v0.9.0/gophish-v0.9.0-linux-64bit.zip
apt install -y unzip
unzip gophish-v0.9.0-linux-64bit.zip
chmod +x gophish
