echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
gpg --keyserver pgpkeys.mit.edu --recv-key  ED444FF07D8D0BF6
gpg -a --export ED444FF07D8D0BF6 | sudo apt-key add -
export DEBIAN_FRONTEND=noninteractive
apt-get -y update
apt-get upgrade -yq
apt-get -y dist-upgrade
apt-get -y autoremove
clear

apt-get install -y git
apt-get install -y wget

echo "Creating /opt/tools for tools download."
mkdir /opt/tools/
cd /opt/tools/
git clone https://github.com/lgandx/Responder
git clone https://github.com/EmpireProject/Empire.git
git clone https://github.com/offensive-security/exploit-database
git clone https://github.com/toolswatch/vFeed.git
git clone https://github.com/secretsquirrel/the-backdoor-factory
git clone https://github.com/FuzzySecurity/PowerShell-Suite.git
git clone https://github.com/peewpw/Invoke-PSImage
git clone https://github.com/madmantm/powershell
git clone https://github.com/Veil-Framework/Veil-Evasion.git
git clone https://github.com/Veil-Framework/Veil-PowerView.git
cd /root/

echo "Creating /root/wordlists directory."
mkdir /root/wordlists/
cd /root/wordlists/
git clone https://github.com/danielmiessler/SecLists.git
wget -nc http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2
wget -nc http://www.tekdefense.com/downloads/wordlists/1aNormusWL.zip
wget -nc http://www.tekdefense.com/downloads/wordlists/KippoWordlist.txt
git clone https://github.com/digininja/CeWL.git
echo "...exiting /root/wordlists"
cd /root/

echo "Creating /root/Downloads directory for metasploit install."
mkdir /root/Downloads/
cd /root/Downloads/
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && chmod 755 msfinstall && ./msfinstall
echo "...exiting /root/Downloads"
cd ..

apt-get install -y nmap
apt-get install -y zenmap
apt-get install -y w3af w3af-console
apt-get install -y nikto
apt-get install -y whatweb
apt-get install -y john
apt-get install -y pdfcrack
apt-get install -y fcrackzip
apt-get install -y ophcrack
apt-get install -y volatility
apt-get install -y dff
apt-get install -y ghex
apt-get install -y aircrack-ng
apt-get install -y ettercap-graphical && apt-get install ettercap-common && apt-get install ettercap-dbg
apt-get install -y yersinia
apt-get install -y sslscan kismet tcpdump dsniff driftnet
pip install wafw00f
pip install --upgrade setuptools && pip install sslyze
pip install droopescan
pip install sqlmap
pip install sslscan && apt-get install sslscan
apt-get install -y hydra hydra-gtk
apt-get install -y dmitry
apt-get install -y havp
apt-get install -y krdc
apt-get install -y medusa
