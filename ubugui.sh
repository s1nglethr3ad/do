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
apt install -y xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils
#apt-get install -y ubuntu-desktop
#sleep 30
#apt-get install -y xrdp
#systemctl enable xrdp
#'useradd burp; echo -e "password\npassword" | passwd burp'
#usermod -aG admin burp 
#usermod -aG sudo burp
