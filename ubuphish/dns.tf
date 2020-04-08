resource "digitalocean_record" "domain" {
    domain = var.domain
    name   = var.sub1
    value  = digitalocean_droplet.phishing-rdr.ipv4_address
    type   = "A"
    ttl    = 6020
}
# phishing redirector A #1
resource "digitalocean_record" "phishing-rdr" {
    domain = var.domain
    name   = "@"
    value  = digitalocean_droplet.phishing-rdr.ipv4_address
    type   = "A"
    ttl    = 60
}
# mail relay A
resource "digitalocean_record" "phishing-rdr-mail-a1" {
    domain = var.domain
    name   = "mail"
    value  = digitalocean_droplet.phishing-rdr.ipv4_address
    type   = "A"
    ttl    = 60
}
# mail relay MX
resource "digitalocean_record" "phishing-rdr-mail-mx" {
    domain = var.domain
    name   = "@"
    value  = "mail.${var.domain}."
    type   = "MX"
    priority = 5
    ttl    = 60
}
# mail relay TXT SPF
resource "digitalocean_record" "phishing-rdr-mail-spf" {
    domain = var.domain
    name   = "@"
    value  = "v=spf1 ip4:${digitalocean_droplet.phishing-rdr.ipv4_address} include:_spf.google.com ~all"
    type   = "TXT"
    ttl    = 60
}
# mail relay TXT DKIM placeholder
resource "digitalocean_record" "phishing-rdr-mail-dkim" {
    domain = var.domain
    name   = "mail._domainkey"
    value  = "I am DKIM, but change me with the DKIM provided by finalize.sh"
    type   = "TXT"
    ttl    = 60
}
# mail relay TXT DMARC
resource "digitalocean_record" "phishing-rdr-mail-dmarc" {
    domain = var.domain
    name   = "_dmarc"
    value  = "v=DMARC1; p=reject"
    type   = "TXT"
    ttl    = 60
}
# phishing server
resource "digitalocean_record" "phishing" {
    domain = var.domain
    name   = var.sub1
    value  = digitalocean_droplet.phishing.ipv4_address
    type   = "A"
    ttl    = 120
}
