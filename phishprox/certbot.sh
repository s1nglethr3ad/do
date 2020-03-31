#!/bin/bash
set -o nounset
set -o errexit
export HOME="/root"
export PATH="${PATH}:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
sleep 5
wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto
mv certbot-auto /usr/local/bin
certbot-auto --noninteractive --os-packages-only
sleep 30
mkdir -p /etc/letsencrypt
cat > /etc/letsencrypt/cli.ini <<EOF
server = https://acme-staging.api.letsencrypt.org/directory
rsa-key-size = 4096
email = admin@example.com
domains = mydomain.com
text = True
non-interactive = True
agree-tos = True
authenticator = standalone
EOF
sleep 30
certbot-auto certonly
sleep 60
sed '20,22d' /root/modlishka.json
echo \ \ \ \ \”cert\”:\”$(awk '{printf "%s\\n", $0}' /etc/letsencrypt/live/crimsonbyte.net/fullchain.pem)\”, >> /root/modlishka.json
echo \ \ \ \ \”certKey\”:\”$(awk '{printf "%s\\n", $0}' /etc/letsencrypt/live/crimsonbyte.net/privkey.pem)\”, >> /root/modlishka.json
echo \ \ \ \ \”certPool\”:\”\”, >> /root/modlishka.json
