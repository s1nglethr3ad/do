output "Name" {
  value = "${digitalocean_droplet.phish.name}"
}

output "outputs" {
  value = "phish IP is ${digitalocean_droplet.phish.ipv4_address}"
}
