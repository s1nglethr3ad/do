echo "SYSTEM UPDATE"
export DEBIAN_FRONTEND=noninteractive
apt-get update && sudo apt-get dist-upgrade -y 
apt-get install --no-install-recommends ubuntu-mate-core ubuntu-mate-desktop -y
apt-get install mate-core mate-desktop-environment mate-notification-daemon xrdp -y
echo "ADD BURP USER"
adduser burp
usermod -aG admin burp 
usermod -aG sudo burp
su - burp
echo "SETUP X11 AND XRDP" 
echo mate-session> ~/.xsession
cp /home/burp/.xsession /etc/skel
service xrdp restart
