provider "digitalocean" {
  token = "APITOKEN"
}
resource "digitalocean_droplet" "phishprox" {
  name     = "phishprox"
  image    = "ubuntu-18-04-x64"
  region   = "nyc3"
  size     = "s-1vcpu-1gb"
  ssh_keys = [SSH-ID]
  provisioner "file" {
    source      = "./configs/modlishka.json"
    destination = "/root/modlishka.json"
    connection {
      type        = "ssh"
      host        = "${self.ipv4_address}"
      private_key = "${file("/Users/user/.ssh/id_rsa")}"
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
      "apt-get install -y certbot",
      "wget https://github.com/drk1wi/Modlishka/releases/download/v.1.1.0/Modlishka-linux-amd64",
      "chmod +x Modlishka-linux-amd64 ; ls -lah",
      #"certbot certonly --manual --preferred-challenges=dns --server https://acme-v02.api.letsencrypt.org/directory --agree-tos -d *.crimsonbyte.net --email noreply@live.com --non-interactive",
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

provider "acme" {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}

resource "tls_private_key" "private_key" {
  algorithm = "RSA"
}

resource "acme_registration" "reg" {
  account_key_pem = tls_private_key.private_key.private_key_pem
  email_address   = "noreply@live.com"
}

resource "tls_private_key" "cert_private_key" {
  algorithm = "RSA"
}

resource "tls_cert_request" "req" {
  key_algorithm   = "RSA"
  private_key_pem = tls_private_key.cert_private_key.private_key_pem
  dns_names       = ["*.yourdomain.com"]

  subject {
    common_name = "yourdomain"
  }
}

resource "acme_certificate" "certificate" {
  account_key_pem         = acme_registration.reg.account_key_pem
  certificate_request_pem = tls_cert_request.req.cert_request_pem

  dns_challenge {
    provider = "route53"
  }
}
