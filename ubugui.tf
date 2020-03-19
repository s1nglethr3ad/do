provider "digitalocean" {
  token = "b5bf5f791c55118f00a80be947f505e528d371b6a8480b89e93ce566f755afda"
}
resource "digitalocean_droplet" "web" {
  name     = "ubuntu-tf-gui"
  image    = "ubuntu-18-04-x64"
  region   = "nyc3"
  size     = "s-4vcpu-8gb"
  ssh_keys = [26847995]
  provisioner "remote-exec" {
    inline = [
      "wget https://raw.githubusercontent.com/s1nglethr3ad/do/master/ubugui.sh",
      "chmod +x build.sh",
      "./build.sh",
    ]
    connection {
      type        = "ssh"
      host        = "${self.ipv4_address}"
      private_key = "${file("/Users/user/do_keys/id_rsa")}"
      user        = "root"
      timeout     = "2m"
    }
  }
}
