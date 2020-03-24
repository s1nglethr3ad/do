provider "digitalocean" {
  token = "INSERTDOAPITOKEN"
}
resource "digitalocean_droplet" "kali" {
  name     = "ubukali"
  image    = "ubuntu-18-04-x64"
  region   = "nyc3"
  size     = "s-4vcpu-8gb"
  ssh_keys = [SSH-ID]
  provisioner "remote-exec" {
    inline = [
      "echo 'deb http://http.kali.org/kali kali-rolling main contrib non-free' | tee -a /etc/apt/sources.list",
      "gpg --keyserver pgpkeys.mit.edu --recv-key  ED444FF07D8D0BF6", 
      "gpg -a --export ED444FF07D8D0BF6 | apt-key add - ",
      "export DEBIAN_FRONTEND=noninteractive",
      "apt-get -y update",
      "apt-get upgrade -yq",
      "apt-get -y dist-upgrade",
      "apt-get -y autoremove",
      "apt-get install -y git",
      "apt-get install -y wget",
      "mkdir /opt/tools/",
      "mkdir /opt/tools/recon",
      "cd /opt/tools/",
      "git clone https://github.com/lgandx/Responder",
      "git clone https://github.com/EmpireProject/Empire.git",
      "git clone https://github.com/offensive-security/exploit-database",
      "git clone https://github.com/secretsquirrel/the-backdoor-factory",
      "git clone https://github.com/FuzzySecurity/PowerShell-Suite.git",
      "git clone https://github.com/peewpw/Invoke-PSImage",
      "git clone https://github.com/madmantm/powershell",
      "git clone https://github.com/Veil-Framework/Veil-Evasion.git",
      "git clone https://github.com/Veil-Framework/Veil-PowerView.git",
      "git clone https://github.com/g0tmi1k/exe2hex.git",
      "git clone https://github.com/lockfale/meterpreterjank.git",
      "git clone https://github.com/PenturaLabs/Linux_Exploit_Suggester.git",
      "git clone https://github.com/vulnersCom/getsploit",
      "git clone https://github.com/trustedsec/unicorn",
      "git clone https://github.com/mattifestation/PowerSploit.git",
      "git clone https://github.com/putterpanda/mimikittenz.git",
      "git clone https://github.com/PowerShellEmpire/PowerTools.git",
      "git clone https://github.com/xan7r/kerberoast.git",
      "git clone https://github.com/CoreSecurity/impacket.git",
      "cd /root/",
      "cd /opt/tools/recon/",
      "git clone https://github.com/guelfoweb/knock.git",
      "git clone https://github.com/laramies/theHarvester.git",
      "git clone https://github.com/eth0izzle/bucket-stream",
      "git clone https://github.com/dmuhs/pastebin-scraper.git",
      "git clone https://github.com/breenmachine/httpscreenshot",
      "git clone https://github.com/m0rtem/CloudFail",
      "git clone https://github.com/laramies/metagoofil",
      "git clone https://github.com/TheRook/subbrute.git",
      "git clone https://github.com/ejcx/subdomainer.git",
      "git clone https://github.com/aboul3la/Sublist3r.git",
      "git clone https://github.com/ChrisTruncer/EyeWitness.git",
      "git clone https://github.com/hatRiot/clusterd.git",
      "git clone https://github.com/dmuhs/pastebin-scraper",
      "git clone https://github.com/nyxgeek/o365recon",
      "git clone https://github.com/darkoperator/dnsrecon.git",
      "git clone https://github.com/urbanadventurer/WhatWeb.git",
      "git clone https://github.com/leebaird/discover.git",
      "git clone https://github.com/Mr-Un1k0d3r/RedTeamPowershellScripts.git",
      "cd /root/",
      "mkdir /root/wordlists/",
      "cd /root/wordlists/",
      "git clone https://github.com/danielmiessler/SecLists.git",
      "wget -nc http://downloads.skullsecurity.org/passwords/rockyou.txt.bz2",
      "wget -nc http://www.tekdefense.com/downloads/wordlists/1aNormusWL.zip",
      "wget -nc http://www.tekdefense.com/downloads/wordlists/KippoWordlist.txt",
      "git clone https://github.com/digininja/CeWL.git",
      "cd /root/",
      "apt-get install -y postgresql",
      "apt-get install -y metasploit-framework",
      "apt-get install -y nmap",
      "apt-get install -y w3af",
      "apt-get install -y nikto",
      "apt-get install -y whatweb",
      "apt-get install -y dff",
      "apt-get install -y ghex",
      "apt-get install -y yersinia",
      "apt-get install -y sslscan tcpdump dsniff driftnet",
      "pip install wafw00f",
      "pip install --upgrade setuptools && pip install sslyze",
      "pip install droopescan",
      "pip install sqlmap",
      "pip install sslscan && apt-get install sslscan",
      "pip install ldap3",
      "apt-get install -y hydra",
      "apt-get install -y dmitry",
      "apt-get install -y krdc",
      "apt-get install -y medusa",
      "touch /usr/bin/locale-check",
      "chmod 755 /usr/bin/locale-check",
      "msfdb init",
    ]
    connection {
      type        = "ssh"
      host        = "${self.ipv4_address}"
      private_key = "${file("/path/to/pub/ssh/key")}"
      user        = "root"
      timeout     = "2m"
    }
  }
}
