output "outputs" {
  value = [
    "${digitalocean_droplet.phishing.name} - ${digitalocean_droplet.phishing.ipv4_address}",
    "${digitalocean_droplet.phishing-rdr.name} - ${digitalocean_droplet.phishing-rdr.ipv4_address}",
  ]
}
