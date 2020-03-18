echo "Getting ready for system updates.  Kali repo and key add."
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
gpg --keyserver pgpkeys.mit.edu --recv-key  ED444FF07D8D0BF6
gpg -a --export ED444FF07D8D0BF6 | sudo apt-key add -
export DEBIAN_FRONTEND=noninteractive
apt-get -y update
apt-get upgrade -yq
apt-get -y dist-upgrade
apt-get -y autoremove
clear

echo "Install git and wget"
apt-get install -y git
apt-get install -y wget
clear

echo "Creating /opt/tools and sub dirs for tools download."
mkdir /opt/tools/
mkdir /opt/tools/webapp/
mkdir /opt/tools/recon
clear

echo "Git download into /opt/tools."
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
git clone https://github.com/longld/peda.git
git clone https://github.com/govolution/avet
git clone https://github.com/g0tmi1k/exe2hex.git
git clone https://github.com/huntergregal/mimipenguin
git clone https://github.com/lockfale/meterpreterjank.git
git clone https://github.com/PenturaLabs/Linux_Exploit_Suggester.git
git clone https://github.com/vulnersCom/getsploit
git clone https://github.com/trustedsec/unicorn
git clone https://github.com/mattifestation/PowerSploit.git
git clone https://github.com/putterpanda/mimikittenz.git
git clone https://github.com/PowerShellEmpire/PowerTools.git
git clone https://github.com/Kevin-Robertson/Inveigh.git
git clone https://github.com/xan7r/kerberoast.git
git clone https://github.com/breenmachine/RottenPotatoNG
git clone https://github.com/AlessandroZ/LaZagne.git
git clone https://github.com/CoreSecurity/impacket.git
cd /root/
clear

echo "Burpsuite into /opt/tools/webapp/"
cd /opt/tools/webapp/
curl https://portswigger.net/DownloadUpdate.ashx?Product=Free -o burpsuite_free.jar
cd /root/
clear

echo "Recon tools into /opt/tools/recon/."
cd /opt/tools/recon/
git clone https://github.com/guelfoweb/knock.git
git clone https://github.com/laramies/theHarvester.git
git clone https://github.com/eth0izzle/bucket-stream
git clone https://github.com/dmuhs/pastebin-scraper.git
git clone https://github.com/breenmachine/httpscreenshot
git clone https://github.com/mschwager/gitem
git clone https://github.com/hardikvasa/google-images-download.git
git clone https://github.com/m0rtem/CloudFail
git clone https://github.com/laramies/metagoofil
git clone https://github.com/TheRook/subbrute.git
git clone https://github.com/ejcx/subdomainer.git
git clone https://github.com/aboul3la/Sublist3r.git
git clone https://github.com/ChrisTruncer/EyeWitness.git
git clone https://github.com/hatRiot/clusterd.git
git clone https://github.com/dmuhs/pastebin-scraper
git clone https://github.com/nyxgeek/o365recon
git clone https://github.com/darkoperator/dnsrecon.git
git clone https://github.com/urbanadventurer/WhatWeb.git
git clone https://github.com/leebaird/discover.git
git clone https://github.com/Mr-Un1k0d3r/RedTeamPowershellScripts.git
git clone https://github.com/makefu/dnsmap.git
cd /root/
clear

echo "Creating /root/wordlists/ directory."
mkdir /root/wordlists/
cd /root/wordlists/
git clone https://github.com/danielmiessler/SecLists.git
wget -nc http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2
wget -nc http://www.tekdefense.com/downloads/wordlists/1aNormusWL.zip
wget -nc http://www.tekdefense.com/downloads/wordlists/KippoWordlist.txt
git clone https://github.com/digininja/CeWL.git
echo "...exiting /root/wordlists/; back to /root/"
cd /root/
clear

echo "apt-get's and pip installs"
apt-get install -y postgresql
apt-get install -y metasploit-framework
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
pip install ldap3
apt-get install -y hydra hydra-gtk
apt-get install -y dmitry
apt-get install -y havp
apt-get install -y krdc
apt-get install -y medusa
clear

echo "Initialize metasploit database with msfdb init."
echo "Create /usr/bin/locale-check needed for database initialization."
touch /usr/bin/locale-check
chmod 755 /usr/bin/locale-check
msfdb init
