provider "digitalocean" {
  token = "APITOKEN"
}
resource "digitalocean_droplet" "web" {
  name     = "phish"
  image    = "ubuntu-18-04-x64"
  region   = "nyc3"
  size     = "s-1vcpu-2gb"
  ssh_keys = [26847995]
  provisioner "remote-exec" {
    inline = [
      "wget https://raw.githubusercontent.com/s1nglethr3ad/do/master/ubuphish/ubuphish.sh",
      "chmod +x ubuphish.sh",
      "./ubuphish.sh"
    ]
    connection {
      type        = "ssh"
      host        = "${self.ipv4_address}"
      private_key = "${file("id_rsa")}"
      user        = "root"
      timeout     = "2m"
    }
  }
}
