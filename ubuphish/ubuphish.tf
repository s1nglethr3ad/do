#ssh root@DO-IP -L3333:localhost:3333 -N -f
#reboot server when build is complete
#./root/gophish to run gophish server
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
      host        = self.ipv4_address
      private_key = file("id_rsa")
      user        = "root"
      timeout     = "2m"
    }
  }
}
### Uncomment this section for certificate and load-balancer(redir)
#resource "digitalocean_certificate" "cert" {
#  name    = "mail"
#  type    = "lets_encrypt"
#  domains = ["mail.mydomain.com"]
#
#  lifecycle {
#    create_before_destroy = true
#  }
#}
#resource "digitalocean_domain" "default" {
#  name       = "mail.mydomain.com"
#  ip_address = digitalocean_droplet.phish.ipv4_address
#}
#resource "digitalocean_loadbalancer" "public" {
#  name   = "loadbalancer-1"
#  region = "nyc3"
#  forwarding_rule {
#    entry_port = 443
#    entry_protocol = "https"
#    target_port = 80
#    target_protocol = "http"
#    certificate_id = digitalocean_certificate.cert.id
#  }
#  healthcheck {
#    port     = 22
#    protocol = "tcp"
#  }
#  droplet_ids = [digitalocean_droplet.phish.id]
#}
