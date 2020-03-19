provider "digitalocean" {
  token = "INSERTDOAPITOKEN"
}
resource "digitalocean_droplet" "web" {
  name     = "ubuntu-tf-gui"
  image    = "ubuntu-18-04-x64"
  region   = "nyc3"
  size     = "s-4vcpu-8gb"
  ssh_keys = [SSH-ID]
  provisioner "remote-exec" {
    inline = [
      "wget https://raw.githubusercontent.com/s1nglethr3ad/do/master/ubugui.sh",
      "chmod +x ubugui.sh",
      "./ubugui.sh",
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
