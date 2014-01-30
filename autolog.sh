##Auto Script By Newradix
#Install Script
curl -s https://raw.github.com/oebanez/VPS/master/coba.sh > coba.sh
chmod +x coba.sh

#Tambahin Tugas di
echo "*/2 * * * * sh /root/coba.sh" >> /var/spool/cron/root

#Cronjob Start
service crond restart
