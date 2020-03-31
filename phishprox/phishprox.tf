provider "digitalocean" {
  token = "APITOKEN"
}

resource "digitalocean_droplet" "phishprox" {
  name     = "phishprox"
  image    = "ubuntu-18-04-x64"
  region   = "nyc3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [26847995]
  provisioner "file" {
    source      = "./configs/modlishka.json"
    destination = "/root/modlishka.json"
    
    connection {
      type        = "ssh"
      host        = self.ipv4_address
      private_key = file("id_rsa")
      user        = "root"
      timeout     = "2m"
    }
  }
  provisioner "file" {
    source      = "./configs/certbot.sh"
    destination = "/root/certbot.sh"
    
    connection {
      type        = "ssh"
      host        = self.ipv4_address
      private_key = file("id_rsa")
      user        = "root"
      timeout     = "2m"
    }
  }

  provisioner "remote-exec" {
    inline = [
      "export DEBIAN_FRONTEND=noninteractive",
      "add-apt-repository universe",
      "apt-get -y update",
      "apt-get upgrade -yq",
      "apt-get -y dist-upgrade",
      "wget https://github.com/drk1wi/Modlishka/releases/download/v.1.1.0/Modlishka-linux-amd64",
      "chmod +x Modlishka-linux-amd64",
      "sleep 60",
      "apt-get install -y python-pip",
      "sleep 30",
      "pip install certbot-dns-digitalocean",
      "sleep 30",
      "chmod +x /root/certbot.sh",
      "chmod +x /root/modlishka.json",
      "chmod +x /root/cert_to_modlishka.sh",
      "./certbot.sh",
      "sleep 60",
      "./cert_to_modlishka.sh",
      ]
    
    connection {
      type        = "ssh"
      host        = self.ipv4_address
      private_key = file("id_rsa")
      user        = "root"
      timeout     = "2m"
    }
  }
}
