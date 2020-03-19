echo "SYSTEM UPDATE"
sudo apt-get update && sudo apt-get dist-upgrade -y 
sudo apt-get install --no-install-recommends ubuntu-mate-core ubuntu-mate-desktop -y
sudo apt-get install mate-core mate-desktop-environment mate-notification-daemon xrdp -y
echo "ADD BURP USER"
adduser burp
usermod -aG admin burp 
usermod -aG sudo burp
su - burp
echo "SETUP X11 AND XRDP" 
echo mate-session> ~/.xsession
sudo cp /home/burp/.xsession /etc/skel
sudo service xrdp restart
