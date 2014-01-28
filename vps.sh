##Auto Script By Newradix
##Edited By LastOebanez
#Set Ke GMT +7
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime

#Update Repo
wget https://raw.github.com/oebanez/VPS/master/epel-release-6-8.noarch.rpm
wget https://raw.github.com/oebanez/VPS/master/remi-release-6.rpm
rpm -Uvh epel-release-6-8.noarch.rpm
rpm -Uvh remi-release-6.rpm
rm -f *.rpm

#Install Tools
yum -y install curl nano wget

#Install VNSTAT 1
wget https://raw.github.com/oebanez/VPS/master/stat.sh && sh stat.sh

#Install VNSTAT 2
wget https://raw.github.com/oebanez/VPS/master/stat2.sh && sh stat2.sh

#Restart VNSTAT
service httpd restart

#install screenfetch
wget https://raw.github.com/oebanez/VPS/master/screenfetch-dev
mv screenfetch-dev /usr/bin/screenfetch
chmod +x /usr/bin/screenfetch
echo "clear" >> .bash_profile
echo "screenfetch" >> .bash_profile

#install webmin
wget http://prdownloads.sourceforge.net/webadmin/webmin-1.670-1.noarch.rpm 
rpm -U webmin-1.670-1.noarch.rpm

#Fix Webmin
/etc/webmin/stop
wget https://raw.github.com/oebanez/VPS/master/miniserv.conf
wget https://raw.github.com/oebanez/VPS/master/xinetd.conf
mv /etc/webmin/miniserv.conf /etc/webmin/miniserv.conf.bak
mv miniserv.conf /etc/webmin/miniserv.conf
mv /etc/xinetd.conf /etc/xinetd.conf.bak
mv xinetd.conf /etc/xinetd.conf
/etc/init.d/xinetd restart

#setting port ssh
echo "Port 143" >> /etc/ssh/sshd_config
echo "Port 109" >> /etc/ssh/sshd_config
echo "Port  22" >> /etc/ssh/sshd_config
service sshd restart
chkconfig sshd on

#install dropbear
yum -y install dropbear
echo "OPTIONS=\"-p 443\"" > /etc/sysconfig/dropbear
echo "/bin/false" >> /etc/shells
service dropbear start
service dropbear restart
chkconfig dropbear on

#Install Script
curl -s https://raw.github.com/oebanez/VPS/kdrop.sh > kdrop.sh
chmod +x kdrop.sh
curl -s https://raw.github.com/oebanez/VPS/master/kopen.sh > kopen.sh
chmod +x kopen.sh
curl -s https://raw.github.com/oebanez/VPS/master/log.sh > log.sh
chmod +x log.sh
curl -s https://raw.github.com/oebanez/VPS/master/cek.sh > cek.sh
chmod +x cek.sh
wget https://raw.github.com/oebanez/VPS/master/speed.py
chmod +x speed.py
wget https://raw.github.com/oebanez/VPS/master/userexp
chmod +x userexp
wget https://raw.github.com/oebanez/VPS/master/delete-log.sh
chmod +x delete-log.sh

#Tambahin Tugas di Cronjob
echo "55 23 * * * sh /root/userexp" > /var/spool/cron/root
echo "58 23 * * * sh /root/cek.sh" >> /var/spool/cron/root
echo "59 23 * * * sh /root/delete-log.sh" >> /var/spool/cron/root

#Cronjob Start
service crond restart
chkconfig crond on

#Install Fail2Ban
yum install fail2ban -y
rm -f /etc/fail2ban/jail.conf
wget https://raw.github.com/oebanez/VPS/master/jail.conf
mv jail.conf /etc/fail2ban/
service fail2ban start
service fail2ban restart
chkconfig fail2ban on

#Install BadVPN
wget -O /usr/bin/badvpn-udpgw "https://raw.github.com/oebanez/VPS/master/badvpn-udpgw"
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.local
sed -i '$ i\screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300' /etc/rc.d/rc.local
chmod +x /usr/bin/badvpn-udpgw
screen -AmdS badvpn badvpn-udpgw --listen-addr 127.0.0.1:7300

#Selesai
clear
echo
echo "-------------------------------------------"
echo "|           Installasi Selesai            |"
echo "|            SET GMT +7 (OK)              |"
echo "|               VNSTAT (OK)               |"
echo "|               WEBMIN (OK)               |"
echo "|          DROPBEAR PORT 443 (OK)         |"
echo "|      OPENSSH PORT 22, 109, 143 (OK)     |"
echo "|             LOG USER (OK)               |"
echo "|         EXPIRED USER USER (OK)          |"
echo "|             SPEEDTEST (OK)              |"
echo "|             FAIL2BAN (OK)               |"
echo "|              CRONJOB (OK)               |"
echo "|    KILL ALL DROPBEAR & OPENSSH (OK)     |" 
echo "-------------------------------------------"
echo 
echo "-------------------------------------------"
echo "|      Script ini Dibuat Oleh Newradix    |"
echo "|    Make Easy Connecting With Internet   |"
echo "-------------------------------------------"
