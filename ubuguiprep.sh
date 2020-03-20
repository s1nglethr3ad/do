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
useradd burp -p password
usermod -aG admin burp 
usermod -aG sudo burp
