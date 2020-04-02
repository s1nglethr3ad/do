output "Name" {
  value = "${digitalocean_droplet.phish.name}"
}

output "Cert_ID" {
  value = "Cert ID is ${digitalocean_certificate.cert.id}"
}

output "outputs" {
  value = "phish IP is ${digitalocean_droplet.phish.ipv4_address}"
}
# Uncomment to display load-balancer IP at the end of build
#output "LB_IP" {
#  value = "Load Balancer IP is ${digitalocean_loadbalancer.public.ip}"
#}
