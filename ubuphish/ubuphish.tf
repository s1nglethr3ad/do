provider "digitalocean" {
  token = "APITOKEN"
}
resource "digitalocean_droplet" "phish" {
  name     = "phish"
  image    = "ubuntu-18-04-x64"
  region   = "nyc3"
  size     = "s-1vcpu-2gb"
  ssh_keys = [SSH-ID]
  provisioner "remote-exec" {
    inline = [
      "export DEBIAN_FRONTEND=noninteractive",
      "add-apt-repository universe",
      "apt-get -y update",
      "apt-get upgrade -yq",
      "apt-get -y dist-upgrade",
      "apt-get install -y postfix",
      "sed -i '40 s/^/#/' /etc/postfix/main.cf",
      "echo 'mynetworks = ${digitalocean_droplet.phish.ipv4_address}' >> /etc/postfix/main.cf",
      "service postfix reload",
      "wget https://github.com/gophish/gophish/releases/download/v0.9.0/gophish-v0.9.0-linux-64bit.zip",
      "apt install -y unzip",
      "unzip gophish-v0.9.0-linux-64bit.zip",
      "chmod +x gophish",
    ]
    connection {
      type        = "ssh"
      host        = "${self.ipv4_address}"
      private_key = "${file("/path/to/ssh/key")}"
      user        = "root"
      timeout     = "2m"
    }
  }
}
