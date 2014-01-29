#!bin/bash
touch /etc/gai.conf
echo "precedence ::ffff:0:0/96  100" >> /etc/gai.conf
reboot
