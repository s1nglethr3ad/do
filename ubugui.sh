echo "SYSTEM UPDATE"
export DEBIAN_FRONTEND=noninteractive
apt-get -y update
apt-get upgrade -yq
apt-get -y dist-upgrade
apt-get install -y ubuntu-desktop
apt-get install xrdp
systemctl enable xrdp
useradd -p password burp
usermod -aG admin burp 
usermod -aG sudo burp
