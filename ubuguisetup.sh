#!/bin/bash
# Install XFCE4
echo "----Install Xubuntu-desktop"
apt install xfce4 xfce4-goodies -y

echo "----Install VNC Server"
# Verify if vnc server is installed
dpkg -s "tightvncserver"|grep "Status: install ok installed" > /dev/null 2>&1
if [[ $? == 1 ]]
        then
                apt install tightvncserver -y
        else
                echo "Already installed"
fi

#Run vncserver and pass parameters
echo "----Run vncserver"
mkdir /root/.vnc
touch /root/.Xauthority
echo password | vncpasswd -f > /root/.vnc/passwd
chown -R root:root /root/.vnc
chmod 0600 /root/.vnc/passwd
vncserver

#Setup firewall rule
echo "----Allow external connects by allowing ports in ufw"
ufw allow 5901/tcp

#Create systemd file
echo "----Create Startup Script"
cat <<EOF > /etc/systemd/system/vncserver@.service
[Unit]
Description=Start TightVNC server at startup
After=syslog.target network.target
[Service]
Type=forking
User=root
PAMName=login
PIDFile=/root/.vnc/%H:%i.pid
ExecStartPre=-/usr/bin/vncserver -kill :%i > /dev/null 2>&1
ExecStart=/usr/bin/vncserver -depth 24 -geometry 1280x800 :%i
ExecStop=/usr/bin/vncserver -kill :%i
[Install]
WantedBy=multi-user.target
EOF
chmod 755 /etc/systemd/system/vncserver@.service
systemctl daemon-reload && systemctl enable vncserver@1.service
sleep 30
shutdown -r now
