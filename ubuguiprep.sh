echo "SYSTEM UPDATE"
export DEBIAN_FRONTEND=noninteractive
add-apt-repository universe
useradd burp -p password
sleep 5
usermod -aG admin burp 
usermod -aG sudo burp
apt-get -y update
sleep 30
apt-get upgrade -yq
sleep 30
apt-get -y dist-upgrade
