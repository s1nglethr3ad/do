provider "digitalocean" {
  token = var.do-token
}

resource "digitalocean_droplet" "phishing" {
  image  = "ubuntu-18-04-x64"
  name   = "phishing"
  region = "nyc1"
  size   = "s-1vcpu-1gb"
  ssh_keys = [SSH-ID]

  provisioner "remote-exec" {
    inline = [
        "export DEBIAN_FRONTEND=noninteractive; apt update && apt-get -y install zip",
        "mkdir -p /opt/gophish; cd /opt/gophish; wget https://github.com/gophish/gophish/releases/download/v0.9.0/gophish-v0.9.0-linux-64bit.zip -O gophish.zip && unzip gophish.zip; chmod +x gophish;",
        "cd /opt/gophish; sed -i 's/127.0.0.1:3333/0.0.0.0:3333/g' config.json",
        "echo \"@reboot root cd /opt/gophish; ./gophish\" >> /etc/cron.d/mdadm",
        "shutdown -r",
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
