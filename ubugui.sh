echo "SYSTEM UPDATE"
export DEBIAN_FRONTEND=noninteractive
apt-get -y update
sleep 30
apt-get upgrade -yq
sleep 30
apt-get -y dist-upgrade
sleep 30
apt-get install -y ubuntu-desktop
#sleep 30
#apt-get install -y xrdp
#systemctl enable xrdp
#'useradd burp; echo -e "password\npassword" | passwd burp'
#usermod -aG admin burp 
#usermod -aG sudo burp
